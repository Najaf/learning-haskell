module PrettyJSON (renderJValue) where

import Numeric    (showHex)
import Data.Char  (ord)
import Data.Bits  (shiftR, (.&.))
import SimpleJSON (JValue(..))
import Prettify (Doc, (<>), char, double, fsep, hcat, punctuate, text, compact, pretty)

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

enclose :: Char -> Char -> Doc -> Doc

renderJValue :: JValue -> Doc

renderJValue (JBool True)  = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull         = text "null"
renderJValue (JNumber num  = double num
renderJValue (JString str) = string str

renderJValue (JArray array) = series '[' ']' renderJValue array
renderJValue (JObject)      = series '{' '}' field obj
  where field (name, val)   = string name
                           <> text ": "
                           <> renderJValue val
