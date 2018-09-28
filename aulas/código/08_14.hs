-- para carregar o arquivo no ghci --> ::load nome_do_arquivo.hs
-- para recarregar o arquivo modificado no ghci --> :r

-- sintaticamente, todo tipo começa com letra maiúscula
-- sintaticamente, toda função começa com letra minúscula
-- após :: tem-se o tipo do argumento recebido
-- após -> tem-se o tipo do valor retornado

-- função :: Tipo
-- função ..... = expressão

funcaoConstante :: Int
funcaoConstante = 30

maiorQue30 :: Int -> Bool
maiorQue30 x = x > 30

quadrado :: Int -> Int
quadrado x = x * x

-- caracteres são representados entre aspas simples
-- haskell consegue inferir tipos de funções

-- em maiorQueC infere que a comparação será feita entre caracteres
maiorQueC x = x > 'C'

valoresIguais :: Int -> Int -> Int -> Bool
valoresIguais x y z = (x == y) && (y == z)


-- Guardas
-- é uma expressão que será avaliada, resultando em um valor booleano.
-- sendo verdadeira a expressão da esquerda, a expressão da direita será executada.
-- avaliadas de cima para baixo.
-- busca-se escrever funções totais, ou seja, que usam todas os valores da entradas.

maxi :: Int -> Int -> Int
maxi x y
    | x > y = x
    | otherwise = y
