
echo :: IO ()
echo = getChar >>= putChar

echoTwice :: IO ()
echoTwice = echo >> echo

echoDup :: IO ()
echoDup = getChar >>= \ c ->
          putChar c >>
          putChar c

getTwoChars :: IO (Char, Char)
getTwoChars = do c1 <-  getChar
                 c2 <-  getChar
                 return (c1,c2)

main :: IO ()
main = getTwoChars
