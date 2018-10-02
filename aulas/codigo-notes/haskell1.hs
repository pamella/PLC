-- Toda função começa com letra minuscula
-- os tipos começam com letra maiúscula
-- função constante
funcaoConstante :: Int
funcaoConstante = 30

-- a seta indica o que vai retornar na função
-- maiorQue30 32, assim se é passado o parâmetro
maiorQue30 :: Int -> Bool
maiorQue30 x = x > 30

-- função que aguarda um inteiro e vai devolver um inteiro
quadrado :: Int -> Int
quadrado x = x * x

-- Haskell é fortemente tipada, não faz comparação entre caracteres e inteiros
maiorQueC x = x > 'C'
-- :t maiorQueC para perguntar o tipo de uma função

t = 't' -- Função constante que retorna o caractere t

-- Função com mais de 1 argumento
valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)

-- função é uma abstração pra uma expressão

-- Guardas
-- Uma expressão que vai ser avaliada e resulta em um valor booleano, 
-- se a expressão for verdade o valor do lado direito vai ser avaliado
-- As guardas são avaliadas de cima pra baixo, a primeira avaliada como verdadeira vai ter 
-- a expressão a direita avaliada
-- Sempre buscamos funções totais, funções que estão definidas para todos os valores da entrada
-- As expressões precisam ser booleanas, para dizer se são verdadeiras ou falsas
-- As expressões avaliadas precisam ser do mesmo tipo definido na função
maxi :: Int -> Int -> Int
maxi x y
    | x > y = x
    | otherwise = y -- caso contrário

-- Forma de fazer comparações sem restringir a um tipo específico, porém só podem ser comparados elementos do mesmo tipo
maxi2 x y
    | x > y = x
    | otherwise = y