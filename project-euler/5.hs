import Data.List (sort)

smallestMultipleOf :: [Int] -> Int
smallestMultipleOf [] = 0
smallestMultipleOf (xs) = head [x | x <- possibleMultiples, x `isMultipleOfAll` xs]
                          where possibleMultiples = tail [0,(maximum xs)..]
                            


isMultipleOfAll :: Int -> [Int] -> Bool
isMultipleOfAll _ []     = True
isMultipleOfAll multiple (x:xs) = if (multiple `isMultipleOf` x) then (multiple `isMultipleOfAll` xs) else False

isMultipleOf :: Int -> Int -> Bool
isMultipleOf multiple 0 = False
isMultipleOf multiple x = multiple `mod` x == 0

main = do putStrLn $ "Smallest multiple of [1..10]: " ++ (show $ smallestMultipleOf [1..10])
          putStrLn $ "Smallest multiple of [1..20]: " ++ (show $ smallestMultipleOf [1..20])

          
