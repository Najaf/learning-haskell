-- file: functional-programming/Map.hs

import Data.Char (toUpper)

-- square every element in a list
square :: [Double] -> [Double]
square [] = []
square (x:xs) = x * x : square xs

-- convert every char to upperCase
upperCase :: String -> String
upperCase     [] = []
upperCase (x:xs) = toUpper x : upperCase xs

-- now with map

mapSquare xs = map squareSingle xs
  where squareSingle x = x * x

mapUpperCase xs = map toUpper xs
