data Maybe a = Just a
             | Empty
             deriving (Show)

data MyTree a = Node a (MyTree a)
                deriving (Show)

aMyTree = Node ("parent") ( Node Just("left child")  Empty Empty)
                          ( Node Just("right child") Empty Empty)
