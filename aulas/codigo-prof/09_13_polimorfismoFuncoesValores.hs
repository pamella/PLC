
mfoldr :: (t -> t -> t) -> t -> [t] -> t
mfoldr f v [] = v
mfoldr f v (x:xs) = f x (mfoldr f v xs)

mfoldr1 :: (t -> t -> t) -> [t] -> t
mfoldr1 f [v] = v
mfoldr1 f (x:xs) = f x (mfoldr1 f  xs)

{-
mfoldr1 (+) [1,2,3]
= (+) 1 (mfoldr1 (+) [2,3])
= (+) 1 ((+) 2 (mfoldr1 (+) [3]))
= (+) 1 ((+) 2 3)
= (+) 1 5
= 6
-}

mfoldl :: (t -> t -> t) -> t -> [t] -> t
mfoldl f v [] = v
mfoldl f v (x:xs) = mfoldl f (f v x) xs

{-
mfoldl (+) 0 [1,2,3]
= mfoldl (+) ((+) 0 1) [2,3]
= mfoldl (+) 1 [2,3]
= mfoldl (+) ((+) 1 2) [3]
= mfoldl (+) 3 [3]
= mfoldl (+) ((+) 3 3) []
= mfoldl (+) 6 []
= 6
-}

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
filtro f (x:xs)
 | f x = x : filtro f xs
 | otherwise = filtro f xs 

sing :: a -> [a]
sing x = [x]

-- Composicao de funcoes

app2 :: (t -> t) -> t -> t
app2 f x = f (f x)

appDuasVezes :: (t -> t) -> (t -> t)
appDuasVezes f = f . f

inc x = x + 1

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id 
iter n f = (iter (n-1) f) . f

{-
iter 2 inc
= (iter (2-1) inc) . inc
= (iter 1 inc) . inc
= ((iter (1-1) inc) . inc) . inc
= ((iter 0 inc) . inc ) . inc
= (id . inc) . inc
-}

addNum :: Int -> (Int -> Int)
addNum n = (\m -> n + m)

multiplica :: Int -> Int -> Int
multiplica x y = x * y