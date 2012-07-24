import Data.Char

main = do
       putStrLn "Hello, what's your first name?"
       firstName <- getLine
       putStrLn "What's your last name?"
       lastName <- getLine
       let bigFirstName = map toUpper firstName
           bigLastName  = map toUpper lastName
       putStrLn $ "Thanks " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
  
