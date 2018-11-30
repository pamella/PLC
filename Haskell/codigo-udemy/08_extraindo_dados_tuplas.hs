-- fst (a, b) retorna primeiro elemento
-- snd (a, b) retorna segundo elemento

nomes :: (String, String, String)
nomes = ("Pam", "plc", "haskell")

selec_fst (x,_, _) = x
selec_snd (_, x, _) = x
selec_trd (_, _, x) = x

{-
selec_fst nomes
selec_fst nomes
selec_trd
-}