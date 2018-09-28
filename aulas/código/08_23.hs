
myNot :: Bool -> Bool
myNot True = False
myNot False = True

vendas 0 = 3
vendas 1 = 5
vendas 2 = 7

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = vendas n + totalVendas (n-1)


-- formas de representar ou-exclusivo
exOr :: Bool -> Bool -> Bool
exOr x y = (x || y) && not (x && y)

exOr2 :: Bool -> Bool -> Bool
exOr2 True False = True
exOr2 False True = True
exOr2 _ _ = False

exOr3 :: Bool -> Bool -> Bool
exOr3 True x = not x
exOr3 False x = x


vendasNulas :: Int -> Bool
vendasNulas 0 = vendas 0 == 0
vendasNulas n = (vendas n == 0) || vendasNulas (n-1)

vendasNulas2 :: Int -> Bool
vendasNulas2 0 = vendas 0 == 0
vendasNulas2 n
    | vendas n == 0 = True
    | otherwise = vendasNulas2 (n-1)


 -- função para retornar um caractere maiusculo
-- desloc = ord 'a' - ord 'A'

-- maiusculo :: Char -> Char
-- maiusculo ch = chr (ord ch - desloc)

-- ehDigito :: Char -> Bool
-- ehDigito ch = (ch >= '0') && (ch <= '9')

-- funções de strings
-- show, showChar
-- putStr ("oi" ++ "\n" ++ "mundo")


-- TUPLAS
-- não exigem tipos homogeneos

intP :: (Int, Int)
intP = (2,3)

addPair :: (Int, Int, Int) -> Int
addPair (x, y, z) = x + y + z

-- função já existente :t fst
primeiro :: (Int, Int) -> Int
primeiro (x,y) = x

-- função já existente :t snd
segundo :: (Int, Int) -> Int
segundo (x,y) = y

shift :: ((Int, Int), Int) -> (Int, (Int, Int))
shift ((x,y),z) = (x,(y,z))

addPair2 :: (Int, Int) -> Int
addPair2 p = primeiro p + segundo p

extraiValor :: (Bool, (Int, Bool), Char) -> Char
-- extraiValor (b1, (i1, b2), c) = c
extraiValor (_, (_, _), c) = c


-- SINONIMOS DE TIPOS
-- palavra reservada type
-- o que temos a esquerda é o sinonimo do que estar a direita
-- por convenção, inicia-se com letra maiuscula

type Nome = String
type Idade = Int
type Fone = String
-- construtor de tipos
type Pessoa = (Nome, Idade, Fone)

idade :: Pessoa -> Idade
idade (n, i , f) = i


type ParInteiro = (Int, Int)


-- EQUAÇÃO DO SEGUNDO GRAU
umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b / (2 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (d - e, d + e)
    where
        d = -b / (2 * a)
        e = sqrt(b^2 - 4.0 * a * c)/ (2.0*a)

raizes :: Float -> Float -> Float -> String
raizes a b c
    | b ^2 == 4.0 * a * c = show(umaRaiz a b c)
    | b ^2 > 4.0 * a * c = show f ++ " " ++ show s
    | otherwise = "Nao hah raizes reais"
        where
            -- f = fst (duasRaizes a b c)
            -- s = snd (duasRaizes a b c)
        (f, s) = duasRaizes a b c