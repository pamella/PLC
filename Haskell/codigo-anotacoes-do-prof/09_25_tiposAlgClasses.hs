
-- Tipos algebricos

data Lista t = Nil | Cons t (Lista t) deriving (Show) --, Eq)

exL1 = Cons 3 (Cons 4 (Cons 5 Nil))
exL2 = Cons 3 (Cons 4 (Cons 5 Nil))

toList :: Lista t -> [t]
toList Nil = []
toList (Cons n l)  = n : toList l

fromList :: [t] -> Lista t
fromList [] = Nil
fromList (x:xs) = Cons x (fromList xs)



data Arvore t = Folha | No t (Arvore t) (Arvore t) deriving Show

exArv = No 2 (No 3 Folha Folha) (No 5 (No 7 Folha Folha) (No 9 Folha Folha))

profundidade :: Arvore t -> Int 
profundidade Folha = 0
profundidade (No n t1 t2) = 1 + 
 max (profundidade t1) (profundidade t2)

collapse :: Arvore t -> [t]
collapse Folha = []
collapse (No n t1 t2) =  (collapse t1)  
                         ++ [n]
                         ++ (collapse t2)

mapTree :: (t -> v) -> Arvore t -> Arvore v
mapTree f Folha = Folha
mapTree f (No n t1 t2) = (No (f n) (mapTree f t1) (mapTree f t2))


allEqual :: (Eq t) => t -> t -> t -> Bool
allEqual x y z = (x == y) && (y == z)

data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab
  deriving (Show, Eq, Ord, Enum, Bounded)

class Visible t where
    toString :: t -> String
    size :: t -> Int

instance Visible Char where
    toString ch = [ch]
    size ch = 1

instance Visible Bool where
    toString True = "True"
    toString False = "False"
    size _ = 1

instance Visible t => Visible [t] where
    toString = concat . (map toString)
    -- size  = length . (map size)
    -- size = (foldr (+) 0) . (map size)
    size [] = 0
    size (x:xs) = size x + size xs

instance Eq t => Eq (Arvore t) where
    Folha  == Folha = True
    (No n1 l1 l11 ) == (No n2 l2 l22) = 
        (n1 == n2) && (l1 == l2) &&
        (l11 == l22)