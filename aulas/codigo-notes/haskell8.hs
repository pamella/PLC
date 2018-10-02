inc :: Int -> Int
inc x = x + 1

twice :: (t -> t) -> t -> t
twice f x = f (f x)

iter :: Int -> (Int -> Int) -> (Int -> Int)
iter 0 f = id
iter n f = (iter (n-1) f) . f

{-
iter 3 inc
= (iter 2 inc) . inc
= ((iter 1 inc) . inc) . inc
= (((iter 0 inc) . inc) . inc) . inc
= ((id . inc) . inc) . inc
-}

-- Notação lambda

-- Inc : (\x -> x + 1)
-- (\x -> x + 1) 3
-- 4

-- addNum n = (\m -> m + n)
-- :t addNum

-- Aplicações parciais

-- Em outras linguagens você não pode dar apenas uma parte dos argumentos, porém em linguagem funcional pode
-- Mesmo dando vários argumentos de uma vez, está apenas acontecendo aplicações parciais

multiplica :: Int -> Int -> Int
multiplica m n = m * n

-- :t multiplica
-- :t multiplica 2

-- let mapMult2 = map (multiplica 2)
-- :t mapMult2
-- mapMult2 [1 .. 5]
-- [2,4,6,8,10]

-- tresIguais 1 2 3 é igual a ( ( tresIguais 1 ) 2 ) 3 -- Associatividade

-- Associatividade a direita

-- t -> u -> v = t -> (u -> v) --Nesse caso aguarda um t
-- t -> u -> v != (t -> u) -> v --Nesse caso aguarda uma função

-- incLista l = map inc l
-- incLista_2 l = map (\x -> x + 1) l
-- f1 l = (filter (\y -> y > 15)) . map (\x -> x * 5)) l
-- f1 [1..5]
-- [20,25]

mzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
mzipWith f (x:xs) (y:ys) = f x y : mzipWith f xs ys

-- Operador de seção

-- :t (+)
-- :t (+2)
-- (+2) 3
-- (2+) 3
-- (>3) 5 -- True
-- (3>) 5 -- False
-- (/2) 4
-- (/2) 5 -- 2.5
-- (2/) 5 -- 0.4

-- (op v) x = x op v
-- (v op) x = v op x

-- iter 4 (/ 2) 2000 -- 125.0
-- iter 4 ((/) 2) 2000 -- 2000.0
-- iter 3 ((/) 2) 2000 -- 1.0e-3

{-
iter 4 (/2)
= (iter 3 (/2)) . (/2)
= ((iter 2 (/2)) . (/2)) . (/2)
= (((iter 1 (/2)) . (/2)) . (/2)) . (/2)
= ((((iter 0 (/2)) . (/2)) . (/2)) . (/2)) .(/2)
= ((((id) . (/2)) . (/2)) . (/2)) . (/2)
-}

{- Incompleto
iter 4 ((/) 2)
= iter 3 ((/) 2) . ((/) 2)
= (((iter 2((/) 2) )) . ((/) 2) . (/) 2)
-}

-- (map.filter) (>5)
-- (map.filter) (>5) [[1..5], [5..7]]
-- [[], [6,7]]