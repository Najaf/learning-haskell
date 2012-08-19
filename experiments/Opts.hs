import System.Environment( getArgs )
import System.Console.GetOpt
import Data.Maybe(fromMaybe)

main = do
  args <-  getArgs
  case getOpt RequireOrder options args of
    (flags, []     , []  ) -> print $ length flags
    (_    , nonOpts, []  ) -> error $ "unrecognized arguments: " ++ unwords nonOpts
    (_    , _      , msgs) -> error $ concat msgs ++ usageInfo header options


data Flag = Version | Input String | Output String

options :: [OptDescr Flag]
options =  [
              Option ['v'] ["version"] (NoArg Version)            "show version number",
              Option ['i'] ["input"]   (ReqArg Input "FILE")      "some option that requires a file argument",
              Option ['o'] ["output"]  (OptArg makeOutput "FILE") "Some option with an optional file argument"
           ]

makeOutput :: Maybe String -> Flag
makeOutput ms = Output ( fromMaybe "stdin" ms )

header = "Usage: main [OPTION...]"
