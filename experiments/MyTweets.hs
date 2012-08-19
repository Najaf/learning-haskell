import Data.List
import Network.HTTP
import Text.JSON
import Text.JSON.Types

--- get all the tweets from the internets, this gives us the raw json
getTweets user = simpleHTTP (getRequest ("http://api.twitter.com/1/statuses/user_timeline.json?screen_name=" ++ user)) >>= getResponseBody

alisTweets = getTweets "alinajaf"

data Tweet = Tweet { text :: String }

instance Show Tweet where
  show tweet = text tweet

instance JSON Tweet where
  readJSON (JSObject o) = return $ Tweet {text=text} where
    text = grab o "text"

grab o s = case get_field o s of
             Nothing -> error "woops"
             Just (JSString s') -> fromJSString s'

tweetsOrError :: String -> [String]
tweetsOrError json = case (decode json :: Result [Tweet]) of
                       Ok tweets   -> (fmap show tweets)
                       Error error -> ["woops!"]

main = do json <-  alisTweets
          putStrLn $ intercalate "\n" (tweetsOrError json)


