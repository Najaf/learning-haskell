
-- more efficient fibs
fibonaccis :: [Int]
fibonaccis = 0 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

fibonacciUnder :: Int -> [Int]
fibonacciUnder x = takeWhile (< x) fibonaccis

main = print $ sum [ x | x <- fibonacciUnder 4000000, mod x 2 == 0]

