member :: [Int] -> Int -> Bool
member [] n = False -- Se fosse True sempre retornaria True independente de ter ali ou n o elemento
member (x:xs) n = (x == n) || member xs n -- Se fosse uma conjunção todos os elementos da lista deveriam ser iguais ao elemento

member2 :: Int -> [Int] -> Bool
member2 n [] = False
member2 n (x:xs)
  | n == x = True
  | otherwise = member2 n xs

-- [1,2] !! 1 - retorna o elemento que está no índice passado, o índice inicia em 0

indice :: [Int] -> Int -> Int -- Não tenho certeza se tá certo
indice l n
  | n == length l = head (reverse l)
  | otherwise = indice (tail l) (n-1)

inverter :: [Int] -> [Int]
inverter [] = []
inverter (x:xs) = inverter xs ++ [x]

-- os dois pontos só funcionam quando se quer colocar algo mtakeInt :: Int -> [Int] -> [Int]na cabeça, pq à direita do dois pontos só aceita uma lista
-- para isso usamos ++
-- take retorna uma lista com os n primeiros valores

mtakeInt :: Int -> [Int] -> [Int]
mtakeInt _ [] = []
mtakeInt 0 _ = []
mtakeInt n (x:xs) = x : mtakeInt (n - 1) xs

mtakeBool :: Int -> [Bool] -> [Bool]
mtakeBool _ [] = []
mtakeBool 0 _ = []
mtakeBool n (x:xs) = x : mtakeBool (n - 1) xs

mtake :: Int -> [t] -> [t] -- letras minúscula para representar uma variável de tipo
mtake _ [] = []
mtake 0 _ = []
mtake n (x:xs) = x : mtake (n - 1) xs

-- Coerção, mudanças de tipo que o desenvolvedor não espera, realizada pelo compilador
-- Eu tenho um operador que tem um identificador, e para aquele id eu tenho varios algorítmos

iSort :: [Int] -> [Int]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)

{-
iSort [6,4,2]
= ins 6 (iSort [4,2])
= ins 6 (ins 4 (iSort [2]))
= ins 6 (ins 4 (ins 2 ([])))
= ins 6 (ins 4 ([2]))
= ins 6 ([2,4])
= [2,4,6]
-}

ins :: Int -> [Int] -> [Int] -- função para inserir um elemento numa lista, em ordem crescente
ins n [] = [n]
ins n (x:xs)
  | n <= x = n:(x:xs)
  | otherwise = x: ins n xs

--ins 4 [3,5]
--3: ins 4 [5]
--3: 4: (5:[])
--[3,4,5]

-- Compreensão de lista
-- {2*x | x pertence {3,4}}
-- {6,8}

-- [x | x <- [2,4]]
-- [2,4]
-- [2 * x | x <- [2,4]]
-- [4,8]
-- [2 * x | x <- [2 .. 10]]

-- representa uma lista, onde o lado esquerda tem uma expressão, e o lado direito informa que cada elemento pertence a uma lista, com uma condição
-- tome os valores da lista l, aqueles que satisfizerem a condição (ou condições) que está descrita, esses valores vão surgir para o cálculo da expressão

-- [2 * x | x <- [2 .. 10], (mod x 2 == 0)]
-- [2 * x | x <- [2 .. 10], (mod x 2 == 0), x > 6]

-- [x + y | (x,y) <- [(1,2), (3,4), (5,6)]]

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

-- [a + b | (a,b) <- [(1,2), (12,4), (8,6)], not(ehPar a), b < 6 ]

tamLista l = sum[1 | _ <- l] -- sempre que houver um valor, escreva 1 na lista, no final vc tem uma lista com um 1 para cada elemento e basta somar para saber o tamanho
triangulos = [(a,b,c) | c <- [1 .. 10], b <- [1 .. 10], a <- [1 .. 10]]
triangulosRet = [(a,b,c) | c <- [1 .. 10], b <- [1 .. c], a <- [1 .. b], a^2 + b^2 == c^2]