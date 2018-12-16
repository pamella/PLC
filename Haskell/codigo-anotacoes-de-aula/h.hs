import Data.Char

{-main = do 
    putStrLn "Oi, Brasil"
    putStrLn "Como te chamo?"
    name <- getLine
    putStrLn("HOLA" ++ name)
    -}
{- assuntos importantes

- compreensão de listas
	SumPares:: [(Int, Int)] -> [Int]
	SumPares lp = [a+b | (a.b) <- lp]

- lambda
	numLong:; Int
	numLong = length (filter (\xs -> length xs > 15) (map chain [1..100]))

- Foldl
	(\acc x -> acc + x) 0 -valor inicial- xs	
- Foldr
	f xs = foldr (\x acc -> f x : acc) [] xs


data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     } 

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday   
           deriving (Eq, Ord, Show, Read, Bounded, Enum) 
-}
venda 0 = 10
venda 1 = 78
venda 2 = 34
venda 3 = 10
venda 4 = 78
venda 5 = 16

vendas :: Int -> Int -> Int
vendas s 0 = if (venda 0 == s) then 1 else 0
vendas s n  
	| s == venda n = 1 + vendas s (n-1) 
	| otherwise = vendas s (n-1)

-- slide 3

fat :: Int -> Int
fat 0 = 1
fat n = n * fat (n-1)

compara :: Int -> Int -> Int -> Int -> Bool
compara x y z w = if ((x == y) && (z == w) && (x == z)) then True else False

compara' :: Int -> Int -> Int -> Int -> Bool
compara' x y z w = if ((x == y) && (z == w) && (x == z)) then True else False

{- let DEFINIÇÕES in EXPRESSÕES
   EXPRESSOES where DEFINIÇÕES
-}

addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = "a" ++ addEspacos (n-1)

paraDireita :: Int -> String -> String
paraDireita 0 str = "" ++ str ++ ""
paraDireita n str = addEspacos n ++ str


--slide 4

{-menoMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior 0 0 0 = (0,0)
menorMaior x y z = -}

--slide 5

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("rafael", "amor meu grande amor")]

--

-- slide 7

{-isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = False
isCrescente f n = f n && isCrescent f (n-1)-}

q :: Int -> Int
q 0 = 0
q n = n*n

mapping :: (Int -> Int) -> [Int] -> [Int]
mapping f [] = []
mapping f (x:xs) = f x : mapping f xs


folding :: (Int -> Int) -> [Int] -> Int
folding f [] = 0
folding f (x:xs) = f x + folding f xs

{-filtering (Int -> Bool) -> [Int] -> [Int]
filtering f [] = []
filtering f (x:xs
    | f x  = x : filtering f xs
    | otherwise   = filtering f xs-}

{-
type Codigo = Int
data Voto = Presidente COdigo | Senador Codigo | Deputado Codigo | Branco deriving (Show)
type Urna = [Voto]
type Apuracao = [(Voto, Integer)]

instance Eq Voto where
    (Presidente p1) == (Presidente p2) = p1 == p2
    (Senador s1) == (Senador s2) = s1 == s2
    (Deputado d1) == (Deputado d2) = d1 == d2
    Branco == Branco = True
    _ == _ = False -}


foldrr:: (Int -> Int) -> [Int] -> Int
foldrr f [] = 0
foldrr f (x:xs) = f x + foldrr f xs

-- Slide lista
member :: [Int] -> Int -> Bool
member [] _ = False
member (x:xs) n 
    | x == n = True
    | otherwise = member xs n


digits ::  String -> String
digits [] = []
digits (x:xs) 
    | isDigit x = x : digits xs
    | otherwise = digits xs 

sumPar :: [(Int,Int)] -> [Int]
sumPar [] = []
sumPar ((a,b):xs) = a+b : sumPar xs

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

livros :: BancoDados -> Pessoa -> [Livro]
livos [] p = []
livros [(p1,l):xs] p
   | p1 == p = l : livros xs p
   | othewise = livros xs p


membro :: [Int] -> Int -> Bool


{-
	type - forma de renomear o tipo pra melhor visualização
	data - defini tipos exemplo bool
        data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)  
	instancia - forma de 'copiar' oq a classe mãe tem
		        instance Show TrafficLight where  
        			  show Red = "Red light"  
      				  show Yellow = "Yellow light"  
       				  show Green = "Green light"  
-}


is_prime :: Int -> Bool
is_prime 0 = False
is_prime 1 = False
is_prime 2 = True
is_prime n | (length [x | x <- [2 .. n-1], mod n x == 0]) > 0 = False
           | otherwise = True


is_square2 :: Int -> Int -> Bool
is_square2 ent init
    |init^2 == ent = True
    |init == ent = False
    |otherwise = is_square2 ent (init + 1)
