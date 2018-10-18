class Visible t where
    toString :: t -> String
    size :: t -> Int

instance Visible Bool where
    toString True = "True"
    toString False = "False"
    size _ = 1

instance Visible t => Visible [t] where --Se t é visible, então lista de t também é visible
    toString = concat . (map toString)
    -- size = length . (map size)
    -- size = (foldr (+) 0) . (map size)
    size [] = 0
    size (x:xs) = size x + size xs

instance Visible Int where
    toString n = show n
    size _ = 1

-- Se você me der uma lista de valores que é Ord e Visible, eu posso retornar isso para você -- vSort :: (Ord t, Visible t) => [t] -> String
-- Se t é um tipo que é uma instância de Eq e u também

type Nome = String
data Pessoa = M Nome | F Nome

instance Show Pessoa where
    show (M n) = n
    show (F n) = n

instance Eq Pessoa where
    (M n1) == (M n2) = n1 == n2
    (F n1) == (F n2) = n1 == n2
    _ == _ = False -- Testar sem essa linha para ver a diferença
-- (M "3") == (M "3")
-- (M "3") == (F "K")

-- Avaliação (lazy) preguiçosa

-- f(2 * 5, 10^3)
-- f(10, 1000)

f :: Int -> Int -> Int
f a b = a + 10

{-
f (30-15) (f 4 8)
=
(30-15) + 10
=
15 + 10
=
25
-}

-- f (30-15) (2^20000)
-- 25

g :: Int -> Int -- Gera loop infinito
g x = x + g x 

-- f (30-15) (g 5) -- Não gera loop pq roda sem executar a função g
-- 25

-- Não vou usar não me dou ao trabalho de avaliar, ideia do lazy evaluation

troca :: Integer -> a -> a -> a
troca n x y
  | n > 0 = x
  | otherwise = y

-- troca 5 'a' 'c'
-- 'a'
-- troca (-1) 'a' 'c'
-- 'c'
-- troca (-1) 1 3 -- 3
-- troca (-1) (2^2000) 3 -- 3
-- troca (-1) (2^20000) 3 -- 3
-- Não avalia a expressão 2^2000

-- troca (1) ((2^200000)::Int) 3
-- 0

h :: Int -> Int -> Int
h x y = x + y

-- h (10-7) (10-7)
-- (10-7) + (10-7) -- Elas não vão ser avaliadas 2 vezes, vai haver uma avaliação só e nós vamos ter um resultado, e as 2 expressões vão se referir a esse mesmo valor (isso ajuda na otimização)
-- 6

fk :: [Int] -> [Int] -> Int -- Some os valores que estão na cabeça das listas e o resultado vai ser o inteiro que representa esse valor
fk (x:xs) (y:ys) = x + y

-- fk [1 .. 5] [500..555]
-- 501
-- fk [1 .. 5] [500 ..] -- Iria rodar infinitamente, porém é uma lazzy evaluation, logo não executa realmente todo o método
-- 501

{-
fk [1..5] [500..]
= (1:[2..5]) (500:[501..])
= 1 + 500
= 501
-}

-- Outro exemplo é a função head, que retorna resultado mesmo em listas infinitas
-- head [1..]
-- 1
-- Outro exemplo: função !!
-- [1..] !! 10
-- 11
-- Calcula até o necessário, não é mais necessário deixa pra lá

-- f a b = a + 10
-- f 5 2^20000 = 5 + 10

-- Chamada de cauda

fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial (n-1)
-- Dá problema para valores altos, como 80

{-
fatorial 3
= 3 * (fatorial 2)
= 3 * (2 * (fatorial 1))
= 3 * (2 * (1 * (fatorial 0)))
= 3 * (2 * (1 * 1))
-}

-- Calculo de valor muito alto pode ser que a gente chegue em um estouro de pilha

tailFat :: Int -> Int -> Int
tailFat 0 x = x
tailFat n x = tailFat (n-1) (n*x)

fat n = tailFat n 1

--tailFat 4 1 
--24

{-
tailFat 3 1
= tailFat 2 3
= tailFat 1 6
= tailFat 0 6
= 6
-}

-- Estamos assegurando que a última chamada a essa função tailFat já possui o resultado dessa função fatorial, a gente não precisa depois voltar e fazer as multiplicações todas dos valores parciais obtidos
-- Isso elimina o risco de estourar pilha, pq a gente não está armazenando na pilha, a gente passa um argumento contendo o valor
-- Chamamos isso de recursão de cauda, chamada de cauda
-- A última chamada já retorna o valor que queremos calcular

-- Falta ver entrada e saída em haskell mas ele não pensa em colocar isso na prova