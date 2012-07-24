main = print $ sum  [x | x <- [1..999], multipleOf 3 x || multipleOf 5 x]
  where multipleOf n x = mod x n == 0
