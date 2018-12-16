-- questao 1
-- testaElementos :: (a -> Bool) -> [a] -> Bool

lista1 = [1..10]
lista2 = [1,3,5]

-- (a) recursao
testaElementosA :: (a -> Bool) -> [a] -> Bool
testaElementosA f [] = True
testaElementosA f (x:xs)
    | f x = testaElementosA f xs
    | otherwise = False

-- (b) map and
testaElementosB :: (a -> Bool) -> [a] -> Bool
testaElementosB f [] = True
testaElementosB f l = auxB (map f l)

auxB :: [Bool] -> Bool
auxB [] = True
auxB (x:xs) = x && auxB xs

-- (c) foldr
testaElementosC :: (a -> Bool) -> [a] -> Bool
testaElementosC f l = 
    foldr (\x y -> x && y) (f (head l)) (map f (tail l))

{-

odd (head [1 .. 3])
(map odd (tail [1 .. 3]))

-}

-- questao 2
-- (a) primos
--primos :: [Int] -> [Int]


-- (b) primosN
primosN :: Int -> [Int]
primosN 0 = []
primosN n 
    | n == 1 = [1]
    | n == 2 = [1,2]
    | mod n 2 /= 0 = primosN (n-1) ++ [n]
    | otherwise = primosN (n-1)


