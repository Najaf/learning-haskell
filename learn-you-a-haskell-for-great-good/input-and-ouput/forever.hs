import Control.Monad
import Data.Char

main = forever $ do
  a <-putStr "More input: "
  l <- getLine
  putStrLn $ map toUpper l
