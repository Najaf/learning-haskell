main = do
       putStrLn "Greeetings! What is your name?"
       inputStr <- getLine
       putStrLn $ "Welcome to Haskell, " ++ inputStr ++ "!"
