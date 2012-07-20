import qualified Data.ByteString.Lazy as L

isElfFile :: FilePath -> IO Bool
isElfFile path = do
  content <- L.readfile path
  return $ hasElfMagic content

hasElfMagic :: L.ByteString -> Bool
hasElfMagic content = L.take 4 content == elfMagic
  where elfMagic = L.pack [0x7f, 0x45, 0x4c, 0x46]


