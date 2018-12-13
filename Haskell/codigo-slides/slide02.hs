import Data.Char

--listas
member :: [Int] -> Int -> Bool
member [] num = False
member (x:xs) num =
    x == num || member xs num

digits :: String -> String
digits [] = ""
digits (x:xs)
    | isDigit x = x : digits xs
    | otherwise = digits xs

sumPairs :: [(Int, Int)] -> [Int]
sumPairs [] = []
sumPairs ((a,b):xs) =
    (a+b) : sumPairs xs

mylength :: [t] -> Int
mylength [] = 0
mylength (x:xs) =
    1 + length xs

myreverse :: [t] -> [t]
myreverse [] = []
myreverse (x:xs) =
    myreverse xs ++ [x]


type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa , Livro)]

baseExemplo :: BancoDados
baseExemplo = [ ("Sergio" , "O Senhor dos Aneis"),
    ("Andre", "Duna"),
    ("Fernando", "Jonathan Strange & Mr. Norrell"),
    ("Fernando", "Duna")]

livros :: BancoDados -> Pessoa -> [Livro]
livros [] x = [x ++ " nao esta no banco de dados"]
livros ((p, l):xs) x
    | x == p = l : livros xs x
    | otherwise = livros xs x


-- compreensao de listas
sumPairs2 :: [(Int, Int)] -> [Int]
sumPairs2 lp = [a*b | (a,b) <- lp]

livros2 :: BancoDados -> Pessoa -> [Livro]
livros2 bd pes = [l | (p,l) <- bd, pes == p]

