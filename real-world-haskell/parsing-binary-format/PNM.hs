import qualified Data.ByteString.Lazy.Char8 as L8
import qualified Data.ByteString.Lazy as L
import Data.Int
import Data.Char (isSpace)

data Greymap = Greymap {
                 greyWidth  :: Int,
                 greyHeight :: Int,
                 greyMax    :: Int,
                 greyData  :: L.ByteString,
               } deriving (Eq)

instance Show Greymap where
  show (Greymap w h m _) = "Greymap " + show w ++ "x" ++ show h ++
                           " " ++ show m 

matchHeader :: L.ByteString -> L.ByteString -> Maybe L.ByteString
matchHeader prefix str | L8.isPrefixOf prefix str 
                         = Just (L8.dropWhile isSpace (L.drop (L.length prefix) str))
                       | otherwise = Nothing

getNat :: L.ByteString -> Maybe (Int, L.ByteString)
getNat s = case L8.readInt s of
             Nothing          -> Nothing
             Just (num, rest) -> | num <= 0   -> Nothing
                                | otherwise -> Just (fromIntegral num, rest)

getBytes :: Int -> L.ByteString -> Maybe(L.ByteString, L.ByteString)
getBytes n str = if L.length prefix < count
                 then Nothing
                 else Just both
                 where count = fromIntegral n
                       both@(prefix, _) = L.splitAt count str

(>>?) :: Maybe a -> (a -> Maybe b) -> Maybe b
Nothing >>? _ =  Nothing
Just v >>? f = f v

skipSpace :: (a, L.ByteString) -> Maybe (a, L.ByteString)
skipSpace (a, s) = Just (a, L8.dropWhile isSpace s)

parseP5_take2 :: L.ByteString -> Maybe (Greymap, L.ByteString)
parsep5_take2 s = 
  matchHeader (L8.pack "P5") s      >>?
  \ s -> skipSpace ((), s)           >>?
  (getNat . snd)                    >>?
  skipSpace                         >>?
  \ (width, s) -> getNat s           >>?
  skipSpace                         >>?
  \ (height, s)  -> getNat s         >>?
  \ (maxGrey, s) -> getBytes 1 s     >>?
  (getBytes (width * height) . snd) >>?
  \ (bitmap, s) -> Just (Greymap width height maxGrey bitmap, s)

parseP5 :: L.ByteString -> Maybe (Greymap, L.ByteString)
parseP5 s = 
  case matchHeader (L8.pack "P5") s of
    Nothing -> Nothing
    Just s1 ->
      case getNat s1 of
        Nothing          -> Nothing
        Just (width, s2) ->
          case getNat (L8.dropWhile isSpace s2) of
            Nothing           -> Nothing
            Just (height, s3) ->
              case getNat (L8.dropWhile isSpace s3) of
                Nothing            -> Nothing
                Just (maxGrey, s4)
                  | maxGrey > 255 -> Nothing
                  | otherwise ->
                    case getBytes 1 s4 of
                      Nothing -> Nothing
                      Just (_, s5) ->
                        case getBytes (width * height) s5 of
                          Nothing -> Nothing
                          Just (bitmap, s6) ->
                            Just (Greymap width height maxGrey bitmap, s6)



data ParseState = ParseState {
                    string :: L.ByteString,
                    offset :: Int64
                  } deriving (Show)

simpleParse :: ParseState -> (a, ParseState)
simpleParse = undefined

betterParse :: ParseState -> Either String (a, ParseState)
betterParse = undefined

newtype Parse a = Parse {
                    runParse :: ParseState -> Either String (a, parseState)
                  }

identity :: a -> Parse a
identity a = Parse (\ s -> Right (a, s))

parse :: Parse a -> L.ByteString -> Either String a
parse parser initState = case runParse parser (ParseState initState 0) of
                         Left err          -> Left err
                         Right (result, _) -> Right result
