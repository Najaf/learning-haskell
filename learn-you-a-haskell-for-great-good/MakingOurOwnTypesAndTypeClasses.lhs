Making Our Own Types and Type Classes
=====================================

On High School Lockers
----------------------
A high-school has lockers so that students have some place to put their guns and
roses posters. We'll use map fom `Data.Map` to represent the lockers. 

> import qualified Data.Map as Map

When a student wants a new locker, they tell the locker supervisor which locker
number they want and he gives them the code. However if someone is already using
that locker, he can't tell them the code for that locker and they have to pick a
different one.

> data LockerState = Taken | Free deriving (Show, Eq)
> type Code        = String

We'll map from locker numbers to a pair of whether the locker is in use or not
and the locker code.

> type LockerMap = Map.Map Int (LockerState, Code)

And now, we're going to make a function that searches for the code in a locker
map. We're going to use an `Either String Code` type to represent our result,
because our lookup can fail in two ways - the locker can be taken, in which case
we can't tell the code or the locker number might not exist at all. If the
lookup fails, we're just going to use a String to tell what's happened.

> lockerLookup :: Int -> LockerMap -> Either String Code
> lockerLookup lockerNumber map = 
>   case Map.lookup lockerNumber map of
>     Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
>     Just (state, code) -> case state of
>       Taken -> Right code
>       Free  -> Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

The Functor Typeclass
---------------------
Now we're going to take a look at the Functor typeclass, which is basically for
things that can be mapped over. You're probably thinking about lists now, since
mapping over lists is such a dominant idiom in functional programming. And
you're right, the list type is part of the functor typeclass.

This is what the Functor implementation looks like:

class Functor f where
  fmap :: (a -> b) -> f a -> f b

Note that f is not a concrete type that a value can hold, but is instead a type
constructor that takes one value. Maybe Int is a concrete type, but Maybe is a
type constructor that takes one type as its parameter. Anyway, we see that
`fmap` takes a function from one type to another and a functor applied with one
type returns a functor applied with another type.

Brain melt! All will be revealed after a few examples.

Compare this with the type declaration of `map` (shown as map' here):

> map' :: (a -> b) -> [a] -> [b]

Dearest friends, we have ourselves here a functor. `map` is just `fmap` that
works only on lists. Here's how a list might be declared as an instance of
Functor:

instance Functor [] where
  fmap = map

So for lists, `fmap` and `map` are equivalent.

Types that act like a box can be functors. You can think of a list as a box that
contains an infinite number of little compartments and they can all be empty,
one can be full and the others empty, or a number of them can be full. So, what
else has the properties of being like a box?

For one, the `Maybe a` type. In a way, it's like a box that can either hold
nothing, in which case the value it has is Nothing, or it can hold one item,
like "Hahaha" in which case it has a value of `Just "Hahaha"`. Here's how
`Maybe` is a Functor:

> instance Functor Maybe where
>   fmap f (Just x) = Just (f x)
>   fmap f Nothing  = Nothing
