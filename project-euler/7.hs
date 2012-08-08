import Data.List

primes :: [Int]
primes = [x | x <- [2..], isOdd x, isPrime x]

isOdd :: Int -> Bool
isOdd x = mod x 2 != 

isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime x = (factors x) == [1,x]

factors :: Int -> [Int]
factors 0 = []
factors 1 = [1]
factors x = sort $ nub [y | y <- [x,x-1..1], x `mod` y == 0]
