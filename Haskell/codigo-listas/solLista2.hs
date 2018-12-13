

c :: [Int] -> [Int]
c (x:xs)  =  [ x | (x,y) <- zip (x:xs) xs, x == y ]

d :: [Int] -> [Int]
d [x]       =  []
d (x:y:zs) | x==y       = x : d (y:zs)
           | otherwise  = d (y:zs)

           
--3a questao
isInRange :: Int -> Bool
isInRange x = 0 <= x && x <= 100

isEven:: Int -> Bool
isEven n = n `mod` 2 == 0

r :: [Int] -> Bool
r xs = foldr (&&) True (map isEven (filter isInRange xs))



--type Nome = String
data Pessoa = M Nome | F Nome

type Relacao a = [(a,a)]
type Familia = Relacao Pessoa

instance Show Pessoa where
        show (M n) = n
        show (F n) = n

instance Eq Pessoa where
         (M n1)  == (M n2) = n1 == n2
         (F n1)  == (F n2) = n1 == n2
         _       == _      =  False



type Nome = String
type Potencia = Int
data Lampada = Compacta Nome Potencia | Incand Nome Potencia

instance Show Lampada where
        show (Compacta n1 p1) = "Compacta " ++ n1 ++ " "  ++ show p1
        show (Incand n2 p2)   = "Incandescente" ++ n2 ++ " "  ++  show p2

        
instance Eq Lampada where
   (Compacta n11 p11) == (Compacta n21 p21) = n11 == n21 &&  p11 == p21
   (Incand n12 p12)   == (Incand n22 p22)   = n12 == n22 &&  p12 == p22  
   (Compacta n11 p11) == (Incand n21 p21)  = False 
   (Incand n12 p12)   == (Compacta n22 p22) = False
--    _ == _ = False
                    
            
instance Ord Lampada where
   (Compacta n11 p11) < (Compacta n21 p21) =  p11 < p21
   (Incand n12 p12)   < (Incand n22 p22)   =  p12 < p22        
   (Compacta n11 p11) > (Compacta n21 p21) =  p11 > p21
   (Incand n12 p12)   > (Incand n22 p22)   =  p12 > p22
   (Compacta n11 p11) <= (Compacta n21 p21) =  p11 <= p21
   (Incand n12 p12)   <= (Incand n22 p22)   =  p12 <= p22        
   (Compacta n11 p11) >= (Compacta n21 p21) =  p11 >= p21
   (Incand n12 p12)   >= (Incand n22 p22)   =  p12 >= p22
   
