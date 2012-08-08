import Network.HTTP

main = do blah <- simpleHTTP (getRequest "http://api.twitter.com/1/users/show.json?screen_name=alinajaf") >>= fmap (take 1000) .  getResponseBody
          putStrLn blah
