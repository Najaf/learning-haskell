Higher Order Functions
======================

Functions can take parameters and also return functions. To illustrate this
we're going to make a function that takes a function and applies it twice to
something:

> applyTwice :: (a -> a) -> a -> a
> applyTwice f x = f (f x)

Lets implement sum with fold:

> sum' :: (Num a) => [a] -> a
> sum' = foldl (+) 0

And now let's try elem (just a function that tells you if an element is part of
a list:

> elem' :: (Eq a) => [a] -> a -> Boolean
> elem' x = foldl (\acc x -> (== x)) 
