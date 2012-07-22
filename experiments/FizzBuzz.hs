
printList :: [String] -> String
printList [] = ""
printList (x:xs) = show x ++ "\n" ++ printList xs

fizzBuzz :: Int -> String
fizzBuzz x | divisableByBoth  x = show x ++ ": FizzBuzz"
           | divisableByThree x = show x ++ ": Fizz"
           | divisableByFive  x = show x ++ ": Buzz"
           | otherwise          = show x ++ ":"
           where
             divisableByBoth  x = divisableByFive x && divisableByThree x
             divisableByFive  = divisableBy 5
             divisableByThree = divisableBy 3
             divisableBy n x    = mod x n == 0

main = do putStr $ printList [fizzBuzz x | x <- [1..100]]

