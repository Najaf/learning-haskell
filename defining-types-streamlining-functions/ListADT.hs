data List a = Cons a (List a)
            | Nil
            deriving (Show)

toList a = Cons a
