
-- file: monads/Logger.hs
module Logger (Logger, Log, runLogger, record) where

type Log = [String]

globToRegex' :: String -> Logger String
globToRegex' "" = return "$"

globToRegex' ('?':cs) = 
  record "any" >>
  globToRegex' cs >>= \ds ->
  return ('.':ds)

globToRegex' ('*':cs) = do
  record "kleene star"
  ds <- globToRegex' cs
  return $ ".*" ++ ds


globToRegex  :: String -> Logger String
runLogger    :: Logger a -> (a, Log)
record       :: String -> Logger ()
