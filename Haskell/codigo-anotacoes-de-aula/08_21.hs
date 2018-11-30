
quadrado :: Int -> Int
quadrado x = x * x

-- em valoreIguais:
-- o primeiro inteiro é aplicado na função, resultando em uma nova função
-- essa nova função espera o próximo inteiro, que também resulta em outra função
-- e essa última função espera o último inteiro
valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

-- if then else não é um comando, mas sim uma expressão
-- retorna um valor do mesmo tipo que está no else
-- é obrigatório o uso do else para retornar o valor como resultado
maxiIF :: Int -> Int -> Int
maxiIF x y = if x >= y then x else y

-- FUNÇÕES RECURSIVAS

-- função que diz quantos itens foram vendidos em cada semana
-- vendas semana = itens vendidos
vendas 0 = 5
vendas 1 = 7
vendas 2 = 15
vendas 3 = 9

-- totalVendas = vendas 0 + vendas 1 + vendas 2 + vendas 3
-- recebe um inteiro, retorna um inteiro
totalVendas :: Int -> Int
totalVendas n  
    | n == 0 = vendas 0 -- caso base (o quanto foi vendido na semana 0)
    | otherwise = vendas n + totalVendas (n-1) -- caso recursivo

{-
    [avaliação] totalVendas 2

    vendas 2 + totalVendas (2-1)
    vendas 2 + (vendas 1 + totalVendas (1-1))
    vendas 2 + (vendas 1 + vendas 0)
    15 + 7 + 5
    27
-}

maxiVendas :: Int -> Int
maxiVendas n
    | n == 0 = vendas 0 -- caso base
    | otherwise = maxiIF (vendas n) (maxiVendas (n-1))  -- caso recursivo

{-
    [avaliação] maxiVendas 2

    maxiIF (vendas 2) (maxiVendas (2-1))
    maxiIF (vendas 2) maxiIF((vendas 1) maxiVendas (1-1))
    maxiIF (vendas 2) maxiIF( (vendas 1) (vendas 0))
    maxiIF (vendas 2) (vendas 1)
    vendas 2
    15
-}


-- CASAMENTO DE PADRÃO
-- repete-se o nome da função para justamente ser possível o casamento do padrão
-- a ordem das linhas (padrões) importam

totalVendas2 :: Int -> Int
totalVendas2 0 = vendas 0 -- padrão caso base
totalVendas2 n  = vendas n + (totalVendas2 (n-1))   -- padrão caso recursivo

maxiVendas2 :: Int -> Int
maxiVendas2 0 = vendas 0 -- padrão caso base
maxiVendas2 n = maxiIF (vendas n) (maxiVendas (n-1))  -- padrão caso recursivo

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
myAnd3 False _ = False  -- o underline significa que o valor será ignorado; o valor não interessa

myAnd4 :: Bool -> Bool -> Bool
myAnd4 True x = x
myAnd4 _ _ = False -- qualquer outro casamento, os valores não me interessam, o resultado será sempre falso
