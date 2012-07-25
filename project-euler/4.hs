{- 
   A palindromic number reads the same both ways. The largest palindrome made 
   from the product of two 2-digit numbers is 9009 = 91 99.
   Find the largest palindrome made from the product of two 3-digit numbers.
-}

import Data.List

isPalindrome :: (Show a) => a -> Bool
isPalindrome x = s == reverse s
  where s = show x

nDigitProducts :: Int -> [Int]
nDigitProducts n = [x * y | x <- nDigitNumbers n, y <- nDigitNumbers n]

uniq :: (Eq a) => [a] -> [a]
uniq [] = []
uniq xs = reverse $ foldl something [] xs
          where something acc x = if contains acc x then acc else x : acc

contains :: (Eq a) => [a] -> a -> Bool
contains []     _ = False
contains (x:xs) y = if x == y then True else contains xs y

nDigitNumbers :: Int -> [Int]
nDigitNumbers n = [x | x <- [digitMin n .. digitMax n]]
  where
    digitMax 0 = 0
    digitMax n = 9 * 10 ^ n' + digitMax n' where n' = n - 1
    digitMin n = 10 ^ (n - 1)

largestPalindrome :: (Show a, Ord a) => [a] -> a
largestPalindrome xs = maximum [ x | x <- xs, isPalindrome x]

main = print $ largestPalindrome (nDigitProducts 3)
