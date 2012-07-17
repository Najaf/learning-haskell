-- file writing-a-library/SimpleJSON.hs
module SimpleJSON
  (
    JValue(..)
  , getString
  , getInt
  , getDouble
  , getBool
  , getObject
  , getArray
  , isNull
  ) where

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)

getString (JString s) = Just s
getString _ = Nothing

getInt (JNumber s) = Just (truncate s)
getInt _ = Nothing

getDouble (JNumber s) = Just s
getDouble _ = Nothing

getBool (JBool s) = Just s
getBool _ = Nothing

getObject (JObject s) = Just s
getObject _ = Nothing

getArray (JArray s) = Just s
getArray _ = Nothing

isNull v = v == JNull
