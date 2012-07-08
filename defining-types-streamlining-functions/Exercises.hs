import Data.List
import Data.Function

-- 1. Write a function that computes the number of elements in a list
-- 2. Add a type signature for the function

myLength :: [a] -> Int
myLength []      = 0
myLength (x:xs)  = 1 + myLength xs

-- 3. Write a function that computes the mean of a list

myMean :: [Double] -> Double
myMean xs = sum xs / fromIntegral(length xs)

-- 4. Turn a list into a palindrome, i.e. it should read [1,2,3,3,2,1] for
-- [3,2,1]

palindromify :: [a] -> [a]
palindromify [] = []
xs = xs ++ reverse xs

-- 5. Write a function that determines whether an input list is a palindrome
isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse(xs)

-- 6. Create a function that sorts a list of lists based on the length of each
-- sublist.
sortByLength :: [[a]] -> [[a]]
sortByLength xs = sortBy (compare `on` length) xs

-- 7. Define a function that joins a list of lists together using a separator
-- value
interjoin :: a -> [[a]] -> [a]
interjoin []  = []
interjoin [x] = [x]
interjoin xs  =
