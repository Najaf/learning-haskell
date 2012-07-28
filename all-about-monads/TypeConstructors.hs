comb :: Maybe a -> (a -> Maybe b) -> Maybe b
comb Nothing _  = Nothing
comb (Just x) f = f x

mothersPaternalGrandfather s = (Just s) `comb` mother `comb` father `comb` father
