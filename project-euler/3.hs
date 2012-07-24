-- The prime factors of 13195 are 5, 7, 13 and 29
-- What is the largest prime factor of 600851475143

factorsOf :: Integer -> [Integer]
factorsOf n = [ x | x <- [1..r] ++ [n], mod n x == 0]
            where r = floor (sqrt $ fromIntegral n)

isPrime :: Integer -> Bool
isPrime x = factorsOf x == [1,x]

primeFactorsOf :: Integer -> [Integer]
primeFactorsOf n = [ x | x <- factorsOf n, isPrime x]

largestPrimeFactorOf :: Integer -> Integer
largestPrimeFactorOf x = maximum $ primeFactorsOf x

main = print $ largestPrimeFactorOf 600851475143
