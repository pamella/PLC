-- fatorial
{-

1! = 0! = 1 (caso base)

3! = 3 * 2 * 1 = 6
4! = 4 * 3! = 24
5! = 5 * 4! = 120
-}
fatorial 0 = 1
fatorial n = n * fatorial(n-1)
