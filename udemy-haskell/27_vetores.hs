-- vetores
-- biblioteca array
import Data.Array

-- array (linha, coluna)

-- array unidimensional
get_array = array (1, 4) [(1, 1), (2,2), (3,3), (4,4)]

{-

elems get_array -- retorna os elementos do array
get_array ! n   -- retorna o elemento da posicao n
bounds get_array    -- retorna limite do array

-}

-- matriz 2x2
matriz = array ((1,1), (2,2)) [((1,1), 'A'), ((1, 2), 'B'), ((2,1), 'C'), ((2,2), 'D')]
