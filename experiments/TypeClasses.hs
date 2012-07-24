data TrafficLight = Red | Yellow | Green deriving (Show)
instance Eq TrafficLight where
  Red == Red       = True
  Green == Green   = True
  Yellow == Yellow = True
  _ == _           = False
