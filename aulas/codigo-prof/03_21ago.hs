

quadrado :: Int -> Int
quadrado x = x * x

valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

maxiIF :: Int -> Int -> Int
maxiIF x y = if x >= y then x else y


-- Funcoes recursivas
 
vendas 0 = 5
vendas 1 = 7
vendas 2 = 15
vendas 3 = 9

totalVendas :: Int -> Int
totalVendas n 
  | n == 0 = vendas 0  -- Caso base
  | otherwise = vendas n + totalVendas (n-1) -- Caso recursivo

maxVendas :: Int -> Int
maxVendas n
 | n == 0 = vendas 0 -- Caso base
 | otherwise = maxiIF (vendas n) (maxVendas (n-1)) -- Caso recursivo

 -- Casamento de padrao

totalVendas2 :: Int -> Int
totalVendas2 0 = vendas 0
totalVendas2 n = vendas n + totalVendas2 (n-1)

maxVendas2 :: Int -> Int
maxVendas2 0 = vendas 0 -- Caso base
maxVendas2 n = maxiIF (vendas n) (maxVendas (n-1)) -- Caso recursivo

mynot :: Bool -> Bool
mynot True = False
mynot False = True

myAnd :: Bool -> Bool -> Bool
myAnd True True = True
myAnd True False = False
myAnd False True = False
myAnd False False = False

myAnd2 :: Bool -> Bool -> Bool
myAnd2 True x = x
myAnd2 False x = False

myAnd3 :: Bool -> Bool -> Bool
myAnd3 True x = x
myAnd3 False _ = False

myAnd4 :: Bool -> Bool -> Bool
myAnd4 True x = x
myAnd4 _ _ = False


