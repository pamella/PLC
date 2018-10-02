
funcaoConstante :: Int
funcaoConstante = 30

maiorQue30 ::  Int -> Bool
maiorQue30 x = x > 30

quadrado :: Int -> Int
quadrado x = x * x

t = 't'

maiorQueC x = x > 'C'

valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

-- Guardas

maxi :: Int -> Int -> Int
maxi x y
  | x > y = x
  | otherwise = y

----
fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial(n-1)

somaQuadrados :: Int -> Int -> Int
somaQuadrados x y = quadX + quadY
  where
    quadX  = x * x
    quadY  = y * y

-- (let .... in ...)  + 20

aplicaF :: (Int -> Int) -> Int -> Int
aplicaF f x = f x + 2

--f :: (Ord b , Num a) => a -> a -> a -> b


somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = x + somaLista xs


ind :: [a] -> Int -> a
ind l@(x:xs) n 
 | n == length l = last xs
 | otherwise = ind (x:init xs) n
