tamLista :: [t] -> Int
tamLista [] = 0
tamLista (x:xs) = 1 + tamLista xs

-- Na lista precisa haver uniformidade dos tipos
-- String é uma lista de caracteres

mzip :: [a] -> [b] -> [(a,b)]
mzip [] _ = []
mzip _ [] = []
mzip (x:xs) (y:ys) = (x,y) : mzip xs ys

mzip2 :: [a] -> [b] -> [(a,b)]
mzip2 (x:xs) (y:ys) = (x,y) : mzip2 xs ys
mzip2 _ _ = [] --Este caso precisa vir na segunda linha, pq senão sempre entraria nessa condição

{-
mzip [1,2,3] [True,False]
= (1,True) : mzip [2,3] [False]
= (1,True) : (2,False) : mzip [3] []
= (1,True) : (2,False) : []
= [(1,True) , (2,False)]
-}

-- Funções de alta ordem
-- Funções que recebem como parâmetro uma outra função

inc :: Int -> Int
inc x = x + 1

aplicaDuasVezes :: (t -> t) -> t -> t
aplicaDuasVezes f x = f (f x)

-- aplicaDuasVezes inc 1

vendas 0 = 1
vendas 1 = 14
vendas 2 = 12

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = vendas n + totalVendas(n-1)

quadrado :: Int -> Int
quadrado x = x * x

somaQuadrados :: Int -> Int
somaQuadrados 0 = quadrado 0
somaQuadrados n = quadrado n + somaQuadrados (n-1)

total :: (Int -> Int) -> Int -> Int
total f 0 = f 0
total f n = f n + total f (n-1)

maxi :: Int -> Int -> Int
maxi x y
  | x >= y = x
  | otherwise = y

maxFun :: (Int -> Int) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = maxi (f n) (maxFun f (n-1)) 

dobroL :: [Int] -> [Int]
dobroL [] = []
dobroL (x:xs) = (2*x) : dobroL xs -- é como se tivesse feito (*) 2 x

quadradoL :: [Int] -> [Int]
quadradoL [] = []
quadradoL (x:xs) = (x*x) : quadradoL xs -- é como se tivesse feito (*) x x

-- Ambas tem o mesmo funcionamento só muda que uma usa a função dobro e a outra a função quadrado

mapLInt :: (Int -> Int) -> [Int] -> [Int]
mapLInt f [] = []
mapLInt f (x:xs) = (f x) : mapLInt f xs

map2 :: (a -> b) -> [a] -> [b] -- os 'a' devem ser do mesmo tipo e os 'b' também
map2 f [] = []
map2 f (x:xs) = f x : map2 f xs

mapCL f l = [ f x | x <- l ]

-- folding

somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (x:xs) = (+) x (somaLista xs)

disjL :: [Bool] -> Bool
disjL [] = False
disjL (x:xs) = (||) x (disjL xs)

mfold :: (t -> t -> t) -> [t] -> t -- Função que aplica uma função f à lista, por exemplo, passar a função de soma e o resultado será a soma de todos os elementos da lista passada
mfold f [x] = x
mfold f (x:xs) = f x (mfold f xs)
--mfold eh foldr1 no ghci

-- mfold (+) [1..5]
-- 15

mfold2 :: (t -> t -> t) -> t -> [t] -> t -- Mesmo que o mfold, porém passa um valor v que participará da aplicação dessa função na lista, por exemplo se a função for soma você estará passando um valor que será somado à soma final.
mfold2 f v [] = v
mfold2 f v (x:xs) = f x (mfold2 f v xs)
-- mfold2 eh foldr no ghci
-- foldr (+) 0 [1..5]
-- foldr (*) 1 [1..5]

{-
mfold2 (+) 0 [1..3]
= (+) 1 (mfold2 (+) 0 [2,3])
= (+) 1 ((+) 2 (mfold2 (+) 0 [3])
= (+) 1 ((+) 2 ((+) 3 (mfold2 (+) 0 [] )))
= (+) 1 ((+) 2 ((+) 3 (0)))
= (+) 1 ((+) 2 3)
= (+) 1 5
= 6
-}

mconcat :: [[t]] -> [t]
mconcat l = foldr1 (++) l

ehPar :: Int -> Bool
ehPar x = x `mod` 2 == 0

--foldr foldr1 foldl foldl1 -- o que diferencia é a ordem que vai consumindo, left da direita pra esquerda, right da esquerda pra direita

--filter ehPar [1..10] - [2,4,6,8,10]
--filter (not, ehPar) [1..10] - [1,3,5,7,9]

filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
filtro f (x:xs)
  | f x = x : filtro f xs
  | otherwise = filtro f xs