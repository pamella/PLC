-- retorna o inverso da lista
{-
entrada: [1,2,3]
saída: [3,2,1]
-}

-- 1ª forma de fazer (mais complicada)
inv_aux :: [t] -> [t] -> [t]
inv_aux [] l_inv = l_inv
inv_aux (x:xs)l_inv = inv_aux xs l_inv++[x]

inv_lista1 :: [t] -> [t]
inv_lista1 [] = []
inv_lista1 l = inv_aux l []


-- 2ª forma de fazer
inv_lista2 :: [t] -> [t]
inv_lista2 [] = []
inv_lista2 (x:xs) = inv_lista2 xs ++ [x]


-- 3ª forma de fazer
reverseList [] = []
reverseList xs = last xs : reverseList (init xs)
