--Questão 3
poli :: Int -> Int -> Int -> (Int -> Int)
poli a b c = (\x -> a * (x * x) + b * x + c)

listaPoli :: [(Int, Int, Int)] -> [Int -> Int]
listaPoli [] = []
listaPoli ((a,b,c):xs) = (\x -> a * (x * x) + b * x + c) : listaPoli xs

appListaPoli :: [Int -> Int] -> [Int] -> [Int]
appListaPoli [] _ = []
appListaPoli _ [] = []
appListaPoli (x:xs) (y:ys) = x y : appListaPoli xs ys

--Questão 7
type Codigo = Int
data Voto = Presidente Codigo | Senador Codigo | Deputado Codigo | Branco deriving (Show)
type Urna = [Voto]
type Apuracao = [(Voto,Int)]

eq :: Voto -> Voto -> Bool
eq (Presidente x) (Presidente y) = x == y
eq (Senador x) (Senador y) = x == y
eq (Deputado x) (Deputado y) = x == y
eq (Branco) (Branco) = True
eq _ _ = False

totalVotos :: Urna -> Voto -> Int
totalVotos u v = length (filter (\x -> eq x v) u)

apurar :: Urna -> Apuracao
apurar [] = []
apurar (x:xs) = (x, length (filter (\y -> eq y x) (x:xs))) : apurar (filter (\y -> not (eq y x)) (x:xs))