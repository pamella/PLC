--BancoDados = [(String, String)]

l = [("João", "l1"), ("Maria", "l2")]

--emprestar :: BancoDados -> String -> String -> BancoDados
--emprestar bd nome livro = (nome, livro):[x | x <- bd]

-- foldl - é a função aplicada a um valor, cabeça da lista, e o segundo valor resulta do cálculo

{-
mfoldr (+) [1,2,3]
= (+) 1 (mfoldr (+) [2,3])
= (+) 1 ((+) 2 (mfoldr (+) [3]))
= (+) 1 ((+) 2 3)
= (+) 1 5
= 6
-}


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

-- No mfoldr a gente só soma no final, no mfoldl a gente já vai somando desde o começo, tendo o valor parcial


filtro :: (a -> Bool) -> [a] -> [a]
filtro f [] = []
filtro f (x:xs)
  | f x = x : filtro f xs
  | otherwise = filtro f xs


{-
OUTRA FORMA DE CHAMAR O FILTER
 x | x <-[1...10] ehPar
-}

{-
função map
map (a->b) -> [a] -> [b]

função sing
sing 1 = [1]
sing 2 = [2]

função map sing
map sing [1,2]
= [[1],[2]]
-}

-- a função map faz que a função seja aplicada em cada elemento da lista

sing :: a -> [a]
sing x = [x]

--foldr (++) [] (map sing [1,2])
--[1,2]

-- Composição de funções
-- :t (.)

-- a função da direita é a que vai ser executada primeiro, e o resultado vai ser usado para a função da esquerda

{-(f.g)x a função que está a direita do ponto retorna um valor que será usado pela função que está a esquerda do ponto e retorna um valor
ex: (b->c) = f
    (a->b) = g

  (.)  :: (b->c)->(a->b)->a->c

função de a em c: a função g retorna um "b" que será usado em f e retornará um "c"
-}

app2 :: (t -> t) -> t -> t
app2 f x = f (f x)

appDuasVezes :: (t -> t) -> (t -> t)
appDuasVezes f = f . f

inc x = x + 1

iter :: Int -> (t -> t) -> (t -> t) -- Repete a aplicação da função n vezes
iter 0 f = id
iter n f = (iter (n-1) f) . f

-- (iter 2 inc) 3
-- 5

{-
iter 2 inc
= (iter (2-1) inc) . inc
= (iter 1 inc) . inc
= ((iter (1-1) inc) . inc) .inc
= ((iter 0 inc) . inc) . inc
= (id . inc) . inc -- Função resultante, então será aplicado inc sobre 3, depois novamente inc e depois o id -- função identidade
-}

-- id x = x -- função identidade

-- (lambda x . x+1) 1 = 1 --"modelo matemático"
-- (\x -> x+1) -- em Haskell
-- (\x y -> x + y) 3 2
-- 5
-- map (\x -> x+1) [1..9]
-- [2,3,4,5,6,7,8,9,10]

-- funções lambdas permitem escrever funções sem precisar as nomear

-- A função resultante de AddNum ainda aguarda um número que vai ser somado com o primeiro número passado

addNum :: Int -> (Int -> Int)
addNum n = (\m -> n + m)

-- addNum 2
-- se n pegar fazer: let ad2 = addNum 2
-- e aí pode usar, ad2 3 que dá 5
-- ad2 6 que dá 8
-- vai ser sempre adicionado a 2, pq foi passado 2 no parâmetro do addNum salvo em ad2

--Aplicação parcial
multiplica :: Int -> Int -> Int
multiplica x y = x * y

-- let m2 = multiplica 2 -- aplicação parcial
-- :t m2 
-- m2 :: Int -> Int
-- :t multiplica
-- multiplica :: Int -> Int -> Int
-- m2 3 dá 6
-- m2 5 dá 10
-- m2 25 dá 50 == multiplica 2 25

-- map (multiplica 15) [32..40]
-- map multiplica [32..40] -- não funcionaria pois multiplica espera um valor para ser multiplicado pelo primeiro valor
-- dá para verificar isso vendo o tipo de map e multiplica

-- let map15 = map (multiplica 15)
-- map15 [10..16] -- multiplica cada um dos elementos por 15

