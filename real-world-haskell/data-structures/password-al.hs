import Data.List
import System.IO
import Control.Monad(when)
import System.Exit
import System.Environment(getArgs)

main = do
       -- Load the command line arguments
       args <-  getArgs

       -- If we don't have the right no. of args, give an error and abort
       when (length args /= 2) $ do
         putStrLn "Syntax: password-al filename uid"
         exitFailure

       -- Read the file lazily
       content <-  readFile (args !! 0)
       
       -- Compute the username in pure code
       let username = findByUID content (read (args !! 1))

       -- Display the result
       case username of
         Just x  -> putStrLn x
         Nothing -> putStrLn "Could not find that UID"

-- Given the entire input and a UID, see if we can find a username,
findByUID :: String -> Integer -> Maybe String
findByUID content uid = lookup uid al
                        where al = map parseline . lines $ content

-- Convert a colon-separated lines into fields
parseline :: String -> (Integer, String)
parseline input = (read (fields !! 2), (fields !! 0))
                  where fields = split ':' input


-- Takes a delimeter and a list. Break up the list based on the delimeter
split :: Eq a => a -> [a] -> [[a]]

-- If the input is empty, the result is a list of empty lists
split _ [] = [[]]
split delim str = 
  let -- Find the part of the list before delim and put it in "before".
      -- The rest of the list, including the leading delim, goes
      -- in "remainder"
      (before, remainder) = span (/= delim) str
      in
      before : case remainder of
                    [] -> []
                    x -> split delim (tail x)
