-- ordena uma lista crescentemente

{-
remove o menor elemento e adiciona em outra lista

[5,8,1,10]  []
[5,8,10]    [1]
[8,10]      [1,5]
[10]        [1,5,8]
[]          [1,5,8,10]

-}

l0 = [5,8,1,10]
l1 = [1,2,3]
l2 = [3,2,5]


-- retorna o menor elemento da lista
menor :: [Integer] -> Integer
menor [x] = x
menor (x:xs)
 | (x < menor xs) = x
 | otherwise = menor xs


-- remove o menor elemento da lista
remove_menor :: [Integer] -> [Integer]
remove_menor [] = []
remove_menor (x:xs)
 | (x == menor (x:xs)) = xs
 | otherwise = x : remove_menor xs


-- ordena
aux_ordena :: [Integer] -> [Integer] -> [Integer]
aux_ordena lista_ordenada [] = lista_ordenada
aux_ordena lista_ordenada (x:xs) = 
    aux_ordena (lista_ordenada ++ [menor (x:xs)]) (remove_menor (x:xs))

ordena :: [Integer] -> [Integer]
ordena [] = []
ordena lista = aux_ordena [] lista


-- quando nao se quer iterar na lista, basta passar o nome dela.
-- se quiser iterar, passa (x:xs)