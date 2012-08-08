sumOfSquares :: [Int] -> Int
sumOfSquares [] = 0
sumOfSquares xs = sum [ x ^ 2 | x <- xs]

squareOfSum :: [Int] -> Int
squareOfSum [] = 0
squareOfSum xs = sum xs ^ 2

main = do putStrLn $ show ((squareOfSum [1..100]) - (sumOfSquares [1..100]))

