-- file: ch02/add.hs
myNot True  = False
myNot False = True

sumList (x:xs) = x + sumList xs
sumList []     = 0
