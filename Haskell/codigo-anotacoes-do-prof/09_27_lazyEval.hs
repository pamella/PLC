

type Nome = String
data Pessoa = M Nome | F Nome

instance Show Pessoa where
    show (M n) = n
    show (F n) = n

instance Eq Pessoa where
    (M n1) == (M n2) = n1 == n2
    (F n1) == (F n2) = n1 == n2
    _     ==  _     = False
    
-- Avaliacao (lazy) preguicosa

f :: Int -> Int -> Int
f a b = a + 10

{-
f (30-15) (f 4 8)
=
(30-15) + 10
=
15 + 10
=
25
-}

g :: Int -> Int 
g x = x + g x

troca :: Int -> a -> a -> a
troca n x y
 | n > 0 = x
 | otherwise = y

h :: Int -> Int -> Int
h x y = x + y

fk :: [Int] -> [Int] -> Int
fk (x:xs) (y:ys) = x + y

{-
fk [1..5] [500 ..]
= (1:[2..5]) (500:[501 ..])
= 1 + 500
-}

-- Chamada de cauda

fatorial :: Int -> Int 
fatorial 0 = 1
fatorial n = n * fatorial (n-1)

{-
fatorial 3
= 3 * (fatorial 2)
= 3 * (2 * fatorial 1 )
= 3 * (2 * (1 * fatorial 0))
= 3 * (2 * (1 * 1))
-}

tailFat :: Integer -> Integer -> Integer
tailFat 0 x = x
tailFat n x = tailFat (n-1) (n*x)

{-
tailFat 3 1
= tailFat 2 3
= tailFat 1 6
= tailFat 0 6
= 6 
-}

fat n = tailFat n 1