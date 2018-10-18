-- Questão 1
-- Letra a)
f :: [Int] -> [Int]
f (x:y:zs)
  | zs == [] = if x == y then [x] else [] 
  | x == y = x : f (y:zs)
  | otherwise = f (y:zs)

-- Questão 2
g :: [Int] -> Bool
g [] = True
g (x:xs) = foldr (&&) True (map (\y -> mod y 2 == 0) (filter (\z -> z >= 0 && z <= 100) (x:xs)))

-- Questão 3
type Fabricante = String
data Lampada = Compacta Fabricante Int| Incandescente Fabricante Int

getShow :: Int -> String
getShow n = show n

instance Show Lampada where
    show (Compacta f i) = "Compacta " ++ f ++ " " ++ getShow i
    show (Incandescente f i) = "Incandescente " ++ f ++ " " ++ getShow i

getTipo :: Lampada -> String
getTipo (Compacta f i) = "Compacta"
getTipo (Incandescente f i) = "Incandescente"

getFab :: Lampada -> String
getFab (Compacta f i) = f
getFab (Incandescente f i) = f

getPot :: Lampada -> Int
getPot (Compacta f i) = i
getPot (Incandescente f i) = i

eq :: Lampada -> Lampada -> Bool
eq l1 l2
  | getTipo l1 == getTipo l2 = getFab l1 == getFab l2 && getPot l1 == getPot l2
  | otherwise = False