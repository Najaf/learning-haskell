data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
           deriving (Show,Eq)

empty :: Doc
empty  = Empty

char :: Char -> Doc
char c = Char c

text :: String -> Doc
text "" = Empty
text s  = Text s

double :: Double -> Doc
double d = text (show d)

line :: Doc
line = Line

flatten :: Doc -> Doc
flatten (Concat x y)  = flatten x `Concat` flatten y
flatten Line          = Char ' '
flatten (x `Union` _) = flatten x
flatten other         = other

group :: Doc -> Doc
group x = flatten x `Union` x

softline :: Doc
softline = group line

(<>) :: Doc -> Doc -> Doc
Empty <> y = y
x <> Empty = x
x <> y     = Concat x y

(</>) :: Doc -> Doc -> Doc
x </> y = x <> softline <> y


hcat :: [Doc] -> Doc
hcat = fold (<>)

fold :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
fold f = foldr f empty

fsep :: [Doc] -> Doc
fsep = fold (</>)

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p []     = []
punctuate p [d]    = [d]
punctuate p (d:ds) = (d <> p) : punctuate p ds

series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
series open close item = enclose open close . fsep . punctuate (char ',') . map item
