{-
Listas:
type String = [Char]

[1 .. 7]
Retorna lista de caracteres de 1 a 7
[1,2,3,4,5,6,7]

[1, 2 .. 9]
A diferença entre o primeiro e o segundo elemento define o passo da contagem
Nesse caso o paso é 1
[1,2,3,4,5,6,7,8,9]

[1, 3 .. 9]
[1,3,5,7,9]

[2.8, 3.5 .. 9]

[2.8 .. 5.0]
[2.8, 3.8, 4.8]

[1 .. ]

[1+2, 4+5 .. 10]

Quando a lista decresce precisa do passo definido
[10, 9 .. 1]

lista de lista de inteiros: [[2,3]]
-}

-- Funções
somaLista :: [Int] -> Int
-- caso base: lista vazia
somaLista [] = 0
-- caso recursivo: lista tem cabeça e cauda
somaLista (x:xs) = x + somaLista xs

-- Com guardas
somaLista2 :: [Int] -> Int
somaLista2 l
  | l == [] = 0
  | otherwise = head l + somaLista2 (tail l)

-- somar lista é somar a cabeça da lista com o resultado da soma da cauda da lista, que é uma outra lista, vamos trabalhar
-- recursivamente com isso

-- [1, 2, 3]
-- 1 + [2, 3]
-- 1 + ( 2 + [3] )
-- 1 + ( 2 + (3) )

-- x:xs, sendo x a cabeça e xs a cauda
-- : lista vazia
-- dois pontos é uma função que dada uma lista de valores do tipo 'a' a gente entrega uma lista de valores do tipo 'a'
-- [1] tem representação como 1:[]

-- somaLista (x:xs) = x + somaLista xs

-- função head, retorna a cabeça da lista
-- função tail, retorna a cauda da lista
-- head [1,2,3]
-- 1
-- tail [1,2,3]
-- [2,3]
-- tail [3]
-- []

-- :t tail
-- tail :: [a] -> [a]
-- :t last
-- last :: [a] -> a

-- função init, despreza o último elemento de uma lista
-- função last, retorna o último elemento de uma lista

double :: [Int] -> [Int]
double [] = []
double (x:xs) = (2 * x) : double xs  -- Uma lista q tem pelo menos 1 elemento, mesmo q seja apenas a cabeça

-- :t (:)
-- a -> [a] -> [a]

member :: [Int] -> Int -> Bool
member [] n = False -- Se fosse True sempre retornaria True independente de ter ali ou n o elemento
member (x:xs) n = (x == n) || member xs n -- Se fosse uma conjunção todos os elementos da lista deveriam ser iguais ao elemento

ehDigito :: Char -> Bool
ehDigito ch = (ch >= '0') && (ch <= '9')

digits :: [Char] -> [Char]
digits [] = []
digits (x:xs)
  | ehDigito x = x : digits xs
  | otherwise = digits xs

-- digits "qwe7rqwe72adsd254"
-- "772254"

somaParesLista :: [(Int, Int)] -> [Int]
somaParesLista [] = []
somaParesLista ((a,b):xs) = (a+b) : somaParesLista xs 
--Uma lista em que o primeiro elemento é um par, isso casa o padrão, o primeiro elemento dessa lista é um par, o primeiro elemento é a, o segundo elemento é b
-- somaParesLista [(5,4),(6,9),(3,8)]
-- somaParesLista [9,15,11]