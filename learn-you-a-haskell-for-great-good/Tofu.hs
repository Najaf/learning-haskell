class Tofu t where
  tofu :: j a -> t a j

data Frank a b = Frank { frankField :: b a } 
                 deriving (Show)
