
fizzBuzz :: Int -> String
fizzBuzz x | divisableBy 15 x  = show x ++ ": FizzBuzz"
           | divisableBy 3  x  = show x ++ ": Fizz"
           | divisableBy 5  x  = show x ++ ": Buzz"
           | otherwise         = show x ++ ":"
           where
             divisableBy n x    = mod x n == 0

main = do putStr [fizzBuzz x | x <- [1..100]]

