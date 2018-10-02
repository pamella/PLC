
inc :: Int -> Int
inc x = x + 1 

twice :: (t -> t) -> t -> t
twice f x = f (f x)

--iter :: Int -> (Int -> Int) -> (Int -> Int)
iter 0 f = id
iter n f = (iter (n-1) f) . f

{-
iter 3 inc
= (iter 2 inc) . inc
= ((iter 1 inc). inc ). inc
= (((iter 0 inc) . inc). inc ). inc
= ((id . inc). inc ). inc
-}

-- Notacao lambda

--Inc : (\x -> x + 1)


addNum n = (\m -> m + n)

multiplica :: Int -> (Int -> Int)
multiplica m n = m * n

tresIguais :: Int -> Int -> Int -> Bool
tresIguais m n p = (m == n) && (n == p)

inc1Lista l = map inc l
inc1Lista_2 l = map (\x -> x + 1) l
f1 l = (filter (\y -> y > 15). map (\x -> x * 5)) l

mzipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
mzipWith f (x:xs) (y:ys) = f x y : mzipWith f xs ys

{-
iter 4 (/2) 
= (iter 3 (/2)) . (/2)
= ((iter 2 (/2)). (/2)) . (/2)
= (((iter 1 (/2)). (/2)). (/2)) . (/2)
= (((iter 0 (/2)) ) (/2)). (/2)). (/2)) . (/2)
= (( id ) (/2)). (/2)). (/2)) . (/2)

-}


{-
iter 4 ((/) 2)
= (iter 3 ((/) 2)) . ((/) 2)
= (((iter 2((/) 2) )) . ((/) 2) . ((/) 2)
= (iter 1 ((/) 2))). ((/) 2). ((/) 2). ((/) 2)
= (iter 0 ((/) 2)). ((/) 2). ((/) 2). ((/) 2). ((/) 2)
= (id) . ((/) 2). ((/) 2). ((/) 2). ((/) 2)
-}
