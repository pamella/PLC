-- verifica se um elemento pertence a lista
pertence :: [Int] -> Int -> Bool
pertence [] _ = False
pertence (x:xs) n
 | (x == n) = True
 | otherwise = pertence xs n


-- retorna o maior elemento de uma lista
maior :: [Int] -> Int
maior [x] = x
maior (x:xs)
 | (x > maior xs) = x
 | otherwise = maior xs


-- verifica se todos os elementos da lista são pares
todos_pares :: [Int] -> Bool
todos_pares [] = True
todos_pares (x:xs)
 | (mod x 2 /= 0) = False
 | otherwise = todos_pares xs