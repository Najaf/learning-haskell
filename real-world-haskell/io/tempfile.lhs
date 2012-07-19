Functional IO and Temporary Files
=================================
Some imports we'll need later, bear with me for now.

> import System.IO
> import System.Directory(getTemporaryDirectory, removeFile)
> import Control.Exception(finally)

The main entry point. Work with a tempfile in myAction.

> main :: IO ()
> main = withTempFile "mytemp.txt" myAction

The Guts of the Program
-----------------------
Called with the path and handle of a temporary file. When this function exits,
that file will be closed and deleted because myAction was called from
withTempFile.

> myAction :: FilePath -> Handle -> IO ()
> myAction tempname temph = 
>   do 
>     putStrLn "Welcome to tempfile.hs"
>     putStrLn $ "I have a temporary file at " ++ tempname

Let's see what the initial position is

>     pos <- hTell temph
>     putStrLn $ "My initial position is " ++ show pos

Now write some data to the temporary file

>     let tempdata = show [1..10]
>     putStrLn $ "Writing one line containing " ++
>                show (length tempdata) ++ " bytes: " ++
>                tempdata
>     hPutStrLn temph tempdata

Get our new position. This doesn't actually modify pos in memory, but makes the
name "pos" correspond to a different value for the remainder of the "do" block.

>     pos <- hTell temph
>     putStrLn $ "After writing, my new position is " ++ show pos

Seek to the beginning of the file and display it.

>     putStrLn $ "The file content is: "
>     hSeek temph AbsoluteSeek 0

hGetContents performs a lazy read of the entire file

>     c <- hGetContents temph

Copy the file byte-for-byte to stdout, followed by \n

>     putStrLn c

Let's also display that as a Haskell literal

>     putStrLn "Which could be displayed as the Haskell literal:"
>     print c


Do something with a temporary file: withTempFile
------------------------------------------------
This function takes two parameters: a filename pattern and another function. It
will create a temporary file, and pass the name and handle of that file to the
given function.

The temporary file is created with openTempFile. The directory is the one
indicated by getTemporaryDirectory, or, if the system has no notion of a
temporary directory, "." is used. The given pattern is passed to openTempFile.

After the given function terminates, even if it terminates due to an exception,
the handle is closed and the file is deleted.

> withTempFile :: String -> (FilePath -> Handle -> IO a) -> IO a
> withTempFile pattern func =
>   do 
>   tempDir <- catch (getTemporaryDirectory) (\_ -> return ".")
>   (tempfile, temph) <- openTempFile tempDir pattern
>   finally (func tempfile temph)
>           (do hClose temph
>               removeFile tempfile)


