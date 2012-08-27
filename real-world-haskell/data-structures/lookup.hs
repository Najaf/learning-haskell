myLookup :: Eq a =>  a -> [(a,b)] -> Maybe b
myLookup _ []    = Nothing
myLookup k' ((k,v):rest) = if k == k'
                              then Just v 
                              else myLookup k' rest
