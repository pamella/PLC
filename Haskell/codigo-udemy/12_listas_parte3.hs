-- verifica se duas listas sao iguais (contem mesmos elementos e eles estao na mesma posicao)
{-
[1,2,3] e [1,2,3] = True (sao iguais)
[3,2,1] e [1,2,3] = False 
[] e [1,2,3] = False
[1,2] e [] = False
-}

-- se atentar a casos de prioridade para ficar em linhas mais acima

comp_listas :: [Int] -> [Int] -> Bool
comp_listas [] [] = True
comp_listas [] _ = False
comp_listas _ [] = False
comp_listas (a:b) (c:d)
 | (a == c) = comp_listas b d
 | otherwise = False
 