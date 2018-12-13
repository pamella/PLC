addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n =
    " " ++ addEspacos(n-1)

paraDireita :: Int -> String -> String
paraDireita 0 s = s 
paraDireita n s = 
    addEspacos n ++ s


vendas 0 = 12
vendas 1 = 14
vendas 2 = 15

totalVendas :: Float -> Float
totalVendas 0 = vendas 0
totalVendas n =
    vendas n + vendas(n-1)

mediaVendas :: Float -> Float
mediaVendas 0 = totalVendas 0
mediaVendas n =
    (totalVendas n) / n


addPair :: (Int, Int) -> Int
addPair (x, y) = x * y

type Name = String
type Age = Int
type Person = (Name, Age)

name :: Person -> Name
name (n, a) = n


iSort :: [Int] -> [Int]
iSort [] = []
iSort (x:xs) =
    ins x (iSort xs)

ins :: Int -> [Int] -> [Int]
ins num [] = [num]
ins num (x:xs) 
    | num <= x = num:(x:xs) -- insere na cabeça da lista
    | otherwise = x:(ins num xs)


type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

pontoY :: Float -> Reta -> Float
pontoY x ((x1,y1), (x2,y2)) = 
    (a * b) + y1
    where
        a = x - x1
        b = (y2 - y1) / (x2 - x1)

