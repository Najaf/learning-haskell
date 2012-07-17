-- file: functional-programming/IntParse.hs

-- take a string of decimal digits and turn them into an integer
import Data.Char (digitToInt)

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                  in loop acc' xs

asInt :: String -> Int
asInt xs = loop 0 xs


