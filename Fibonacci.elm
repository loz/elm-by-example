module Fibonacci where

import List exposing((::), head, map2, reverse, tail)


fibonacci : Int -> List Int
fibonacci n =
        let fibonacci' n (h1::(h2::t)) = 
                if n <= 2
                   then (h1::(h2::t))
                   else fibonacci' (n-1) ((h1 + h2) :: (h1::(h2::t)))
        in
           fibonacci' n [1, 1] |> reverse

fibonacciWithIndexes: Int -> List (Int, Int)
fibonacciWithIndexes n = map2 (,) [0..n] (fibonacci n)
