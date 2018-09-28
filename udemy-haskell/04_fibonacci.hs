-- fibonacci
{-

sendo n o n-ésimo termo, tem-se
1) se n = 0, ent fib(n) = 0
2) se n = 1, ent fib(n) = 1
3) se n > 1, ent fib(n) = fib(n-2) + fib(n-1)

1 1 2 3 5 8 13 
fib(0) = 0
fib(1) = 1
fib (2) = 1
fib(3) = 2
fib(4) = 3
fib(5) = 5

-}

fib 0 = 0
fib 1 = 1
fib n = fib(n-2) + fib(n-1)
