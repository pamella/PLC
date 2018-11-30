-- type Sinonimo = Tipo

type Nome = String

-- Tipos algebricos (data)

-- Enumeracao
data MBool = MTrue | MFalse

data DiasSemana = Dom | Seg | Ter |
 Qua | Qui | Sex | Sab

data Estacao = Verao | Outono | 
               Inverno | Primavera
data Temperatura = Frio | Quente
  deriving Show

clima :: Estacao -> Temperatura
clima Inverno = Frio
clima _ = Quente

-- Produto

type Idade = Int
data Pessoas = Pessoa Nome Idade deriving Show

exibirNome :: Pessoas -> String
exibirNome (Pessoa n i) = n

data Figura = Circulo Float
        | Retangulo Float Float deriving Show

area :: Figura -> Float
area (Circulo r) = pi * r * r
area (Retangulo l h) = l * h

ehCircular :: Figura -> Bool
ehCircular (Circulo _) = True
ehCircular _ = False

data Expr = Lit Int
   | Add Expr Expr
   | Sub Expr Expr deriving Show

eval :: Expr -> Int
eval (Lit n) = n
eval (Add exp1 exp2) =
       eval exp1 + eval exp2
eval (Sub exp1 exp2) =
       eval exp1 - eval exp2

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

somaListaInt :: ListaInt -> Int
somaListaInt (Vazia) = 0
somaListaInt (Cons n l) = n + somaListaInt l

-- Tipo algebrico polimorfico

data Lista t = Nil | Const t (Lista t) deriving Show

tamanho :: Lista t -> Int
tamanho (Nil) = 0
tamanho (Const _ l) = 1 + tamanho l

data Arvore t = NilArv | No (Arvore t) t (Arvore t) deriving Show