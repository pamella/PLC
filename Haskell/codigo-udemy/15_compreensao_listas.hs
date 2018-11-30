-- compreensao de listas
-- construir e manipular listas

{-
[x | x <- [1,2,3]]
[x | x <- [0..9]]
[x | x <- [1..10], mod x 2 == 0]
-}

par :: Int -> Bool
par x = mod x 2 == 0

l1 = [x | x <- [1..10], par x]
l2 = [x | x <- [1..10], par x, x > 5]
l3 = [x*x | x <- [1..10], par x]

l4 = [(x,y) | x <- [1..5], y <- [6..10]]
