-- file: ch02/add.hs
myNot True  = False
myNot False = True

sumList (x:xs) = x * sumList xs
sumList []     = 1

myFact 1 = 1
myFact n = n * myFact(n - 1)

myAverage [n]    = n
myAverage (x:xs) = (x + myAverage(xs)) / 2
