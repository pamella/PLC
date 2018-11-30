quadrado :: Int -> Int
quadrado x = x * x

-- quadrado 3

-- quadrado (3)

valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

-- valoresIguais 1 2 3;
-- valoresIguais (1,2,3) não é o mesmo tipo que está definido na função, desta forma está passando uma tupla e não um inteiro que é outro tipo
-- valoresIguais (1) (2) (3)
-- valoresIguais (1) (2 * 7) (3 + 6)

maxiIF :: Int -> Int -> Int
maxiIF x y = if x >= y then x else y

-- essa expresaõ retorna um valor
-- if seguido de uma expressão booleana, tem que ter como resultado um valor do mesmo tipo que tem lá no else, 
-- não pode ter if só com then, tem que ter o else tb
-- maxiIF x y = (if x >= y then x else y) + 4 , retorna o valor da soma

vendas 0 = 5 -- vendas na semana 0
vendas 1 = 7
vendas 2 = 15
vendas 3 = 9

-- totalVendas = vendas 0 + vendas 1 + vendas 2

-- quero somar todas as vendas de uma semana específica partindo da semana 0

totalVendas :: Int -> Int
totalVendas n
    | n == 0 = vendas 0 --caso base, onde paramos
    | otherwise = vendas n + totalVendas (n-1) --caso recursivo, caminha em direção ao caso base

{-
totalVendas 2
vendas 2 + totalVendas (2-1)
vendas 2 + (vendas 1 + totalVendas (1-1))
vendas 2 + (vendas 1 + vendas 0)
15 + 7 + 5
27
-}

-- no caso recursivo temos que expressar de alguma forma que aquela chamada sempre vai nos encaminhar para o caso base

maxVendas :: Int -> Int
maxVendas n
    | n == 0 = vendas 0
    | otherwise = maxiIF (vendas n) (maxVendas (n-1))

-- Casamento de padrao

totalVendas2 :: Int -> Int
totalVendas2 0 = vendas 0
totalVendas2 n = vendas n + totalVendas2 (n-1)

maxVendas2 :: Int -> Int
maxVendas2 0 = vendas 0
maxVendas2 n = maxiIF (vendas n) (maxVendas2 (n-1))

-- o nome da função vai se repetindo a cada linha

mynot :: Bool -> Bool
mynot True = False
mynot False = True

-- Conjunção usando casamento de padrão
myAnd :: Bool -> Bool -> Bool
myAnd True True = True
myAnd True False = False
myAnd False True = False
myAnd False False = False

myAnd2 :: Bool -> Bool -> Bool
myAnd2 True x = x -- se o primeiro valor encaixar com True o resultado será o valor do segundo valor
myAnd2 False _ = False -- se o primeiro valor encaixar com False o resultado será False
{-
'_' : eu aguardo um valor, quando o primeiro valor que eu receber casar o padrão, eu aguardo o segundo valor,
mas eu simplesmente não me interesso por ele, eu vou ignorar, ele tende a existir, mas no ponto de vista da 
expressão que eu vou avaliar, eu vou ignorar esse valor
-}

myAnd3 :: Bool -> Bool -> Bool
myAnd3 True x = x
myAnd3 _ _ = False -- independente dos valores vai ser False

-- Padrões da esquerda devem ter tipos compatíveis

-- :t (+) -> as operações em haskell são funções
-- 4 `mod` 3
-- identação com espaços, para não haver conflito entre editores