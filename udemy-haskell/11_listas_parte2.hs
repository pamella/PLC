-- operador : adiciona um elemento no inicio da lista
{-
1:[2,3]     -- adicionar numa lista existente
1:2:3:[]    -- criando uma lista
-}


-- verificar o comprimento de uma lista
-- cortar a cabeca para percorrer ate o final da lista
size_list :: [t] -> Int
-- casamento de padrões
size_list [] = 0
size_list (x:xs) = 1 + size_list xs