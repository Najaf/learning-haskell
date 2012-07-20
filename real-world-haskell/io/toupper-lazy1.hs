import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
       inh  <- openFile "input.txt"  ReadMode
       outh <- openFile "output.txt" WriteMode
       inputStr <- hGetContents inh
       hPutStr outh (map toUpper inputStr)
       hClose inh
       hClose outh



