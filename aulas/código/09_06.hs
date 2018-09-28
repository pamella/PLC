-- x é a cabeça da lista
-- xs é o resto da lista, excluindo-se a cabeça

inverter :: [Int] -> [Int]
inverter [] = []
inverter (x:xs) = inverter xs ++ [x]

-- mtake, o algoritmo é o mesmo, o que muda é o tipo

-- mtakeInt :: Int -> [Int] -> [Int]
-- mtakeInt _ [] = []
-- mtakeInt 0 _ = []
-- mtakeInt n (x:xs) = x : mtakeInt (n-1) xs

-- mtakeBool :: Int -> [Bool] -> [Bool]
-- mtakeBool _ [] = []
-- mtakeBool 0 _ = []
-- mtakeBool n (x:xs) = x : mtakeInt (n-1) xs

-- polimorfismo paramétrico
-- usaremos uma variável de tipo que diz que o tipo muda de forma,
-- mas o algoritmo é o mesmo

-- obter os primeiros elementos de uma lista

-- o tipo pode ser qualquer letra minuscula para representar uma variável de tipo
-- mtake :: Int -> [t] -> [t]
-- mtake _ [] = []
-- mtake 0 _ = []
-- mtake n (x:xs) = x : mtake (n-1) xs


-- iSort
iSort :: [Int] -> [Int]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)

{-
iSort [6, 4, 2]
= ins 6 (iSort [4,2])
= ins 6 (ins 4 (iSort [2]))
= ins 6 (ins 4 (ins 2 (iSort [])))
= ins 6 (ins 4 [2])
= ins 6 [4,2]
 

-}

-- inserir elemento em uma lista ordenada
ins :: Int -> [Int] -> [Int]
ins n [] = [n]
ins n (x:xs)
 | n <=x = n:(x:xs)
 | otherwise = x: ins n xs


-- Compressão de listas
-- é uma expressão
-- { 2x | x E {3, 4}} ---> [ x | x <- l, condicoes]

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

l1 = [ x | x <- [2,4]]
l2 = [ 2*x | x <- [2,4]]
l3 = [ 2*x | x <- [2..10]]
l4 = [ 2*x | x <- [2..10], (mod x 2 == 0)]
l5 = [ 2*x | x <- [2..10], 
            ehPar x, x > 6]
l6 = [ a+b | (a,b) <- [(1,2), (12,4), (8,6)], not (ehPar a)]


tamLista l = sum[1 | _ <- l]
-- l7 = [1 | _ <- [1..9]]
triangulos = [(a,b,c) | c <- [1..10],
                         b <- [1..10],
                         a <- [1..10] ]

triangulosRet = [(a,b,c) | c <- [1..10],
                         b <- [1..c],
                         a <- [1..b],
                         a^2 + b^2 == c^2 ] -- restrição para triangulos retangulos

triangulosRetPer = [(a,b,c) | c <- [1..10],
                         b <- [1..c],
                         a <- [1..b],
                         a^2 + b^2 == c^2,
                         a+b+c > 20 ]                         
                         
                         
