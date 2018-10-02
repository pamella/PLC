{-
(b -> c) -> (a -> b) ->          a -> c
map   .   filter       (a -> Bool) -> [[a]] -> [[a]]
(a -> b) -> ([a] -> [b])  (a -> Bool) -> ([a] -> [a])
[a]->[a]    [[a]]->[[a]]       a
-}
-- Associativa a direita, pode botar o parentese após a primeira seta da esquerda pra direita


-- type Sinonimo = Tipo

type Nome = String

-- Tipos algebricos (data)

-- Enumeração
data MBool = MTrue | MFalse --Como um construtor
--data Nome_tipo = Construtor 1 | Construtor 2 | Construtor 3 --Nome do tipo e construtores com letra maiúscula

data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab

data Estacao = Verao | Outono | Inverno | Primavera
data Temperatura = Frio | Quente
  deriving Show -- Uma instância da classe Show

clima :: Estacao -> Temperatura
clima Verao = Quente
clima Outono = Quente
clima Inverno = Frio
clima Primavera = Quente

--forma melhor de fazer
clima Inverno = Frio
clima _ = Quente

-- Produto

type Idade = int
data Pessoas = Pessoa Nome Idade deriving Show -- o 'Pessoa' funciona como uma tag
-- :t Pessoa "Maria" 15 

exibirNome :: Pessoas -> String
exibirNome (Pessoa n i) = n
-- exibirNOme (Pessoa "Maria" 15)
-- Maria

data Figura = Circulo Float
        | Retangulo Float Float deriving Show
-- Retangulo 2.0 3.5
-- :t Retangulo
-- Retangulo :: Float -> Float -> Figura
-- :t Circulo
-- Circulo :: Float -> Figura


area :: Figura -> Float
area (Circulo r) = pi * r * r
area (Retangulo l h) = l * h

ehCircular :: Figura -> Bool
ehCircular (Circulo _) = True
ehCircular _ = False

--ehCircular (Circulo 2.0)
--True
--ehCircular (Retangulo 3.4 2.0)
--False

figArea :: Fig -> Float
figArea c = areaCirc c

areaCirc :: Circ -> Float
areaCirc (c f) = pi * f * f

data Expr = Lit Int --Criando uma linguagem de expressões
    | Add Expr Expr
    | Sub Expr Expr deriving Show

-- Lit 1 --É uma expressão
-- Add (Lit 1) (Lit 2)
-- Add (Sub (Lit 5) (Lit 3)) (Lit 2)

eval :: Expr -> Int --avaliando a expressão e retornando o resultado dela
eval (Lit n) = n
eval (Add exp1 exp2) = eval exp1 + eval exp2
eval (Sub exp1 exp2) = eval exp1 - eval exp2

{-
eval (Add (Sub (Lit 5) (Lit 3)) (Lit 2))
= eval (Sub (Lit 5) (Lit 3)) + eval (Lit 2)
= (eval (Lit 5) - eval (Lit 3)) + eval (Lit 2)
= (5 - 3) + 2
= 2 + 2
= 4
-}

exibirExp :: Expr -> String
exibirExp (Lit n) = show n
exibirExp (Add e1 e2) = 
    "( " ++ exibirExp e1 ++ " + " ++ exibirExp e2 ++ " )" 
exibirExp (Sub e1 e2) =
    "( " ++ exibirExp e1 ++ " - " ++ exibirExp e2 ++ " )" 

data ListaInt = Vazia | Cons Int ListaInt deriving Show

-- :t Vazia
-- :t Cons 3 (Cons 4 Vazia)

somaListaInt :: ListaInt -> Int
somaListaInt (Vazia) = 0
somaListaInt (Cons n l) = n + somaListaInt l

--somaListaInt (Cons 3 (Cons 4 (Cons 5 Vazia)))
--12

data Lista t = Nil | Const t (Lista t) deriving Show
-- Nil
-- (Const 'a' Nil)
-- (Const 'a' (Const 'b' Nil))

tamanho :: Lista -> Int
tamanho (Nil) = 0
tamanho (Const _ l) = 1 + tamanho l

data Arvore t = NilArv | No (Arvore t) t (Arvore t) deriving Show -- Maneira de descrever uma árvore

-- (No NilArv 3 (No NilArv 5 NilArv))