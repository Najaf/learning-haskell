Some interesting examples of haskell function syntax

> bmiTell :: (RealFloat a) => a -> a -> String
> bmiTell weight height
>   | bmi <= skinny = "You're underweight, you emo, you!"
>   | bmi <= normal = "You're supposedly normal, pffft, I bet you're ugly!"
>   | bmi <= fat    = "You're fat! Lose some weight Fatty!"
>   | otherwise     = "You're a whale! Congratulations"
>   where bmi    = weight / height ^ 2
>         skinny = 18.5
>         normal = 25.0
>         fat    = 30.0
