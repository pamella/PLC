-- Revisao

vendas 0 = 3
vendas 2 = 5
vendas 3 = 8

totalVendas :: Int -> Int
totalVendas n
 | n == 0 = vendas 0
 | otherwise = vendas n + totalVendas (n-1)

totalVendas2 :: Int -> Int
totalVendas2 0 = vendas 0
totalVendas2 n = vendas n + totalVendas2 (n-1)

 -- Listas

 -- type String = [Char]

 -- Funcoes

somaLista :: [Int] -> Int
--caso base: lista vazia
somaLista [] = 0
-- caso recursivo: lista tem cabeca e cauda
somaLista (x:xs) = x + somaLista xs

-- Com guardas
somaLista2 :: [Int] -> Int
somaLista2 l
 | l == [] = 0
 | otherwise = head l + somaLista2 (tail l)

-- Dobrar elementos de uma lista

double :: [Int] -> [Int]
double [] = []
double (x:xs) = (2 * x) : double xs

member ::  Int -> [Int] -> Bool
member n [] = False
member n (x:xs)  = (x == n) || member n xs

ehDigito :: Char -> Bool
ehDigito ch = (ch >= '0') && (ch <= '9')

digits :: [Char] -> [Char]
digits [] = []
digits (x:xs) 
 | ehDigito x = x : digits xs
 | otherwise = digits xs

somaParesLista :: [(Int, Int)] -> [Int]
somaParesLista [] = []
somaParesLista ((a,b):xs) = (a+b) : somaParesLista xs 


{-
member :: [Int] −> Int −> Bool
• filtrar apenas os números de uma lista:
digits :: String −> String
• somarumalistadepares:sumPairs:: [(Int,Int)]−>[Int]
-}

