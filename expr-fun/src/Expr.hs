module Expr where

{- Addition of new method does not need modification of existing code -}

data Expression = Constant Int
                | Add Expression Expression
                | Negation Int


prettyPrint :: Expression -> String
prettyPrint (Constant i) = show i
prettyPrint (Add l r) = prettyPrint l ++ "+" ++ prettyPrint r
prettyPrint (Negation i) = show (-i)
--
evaluate :: Expression  -> Int
evaluate (Constant i) = i
evaluate (Add l r) = evaluate l + evaluate r
evaluate (Negation i) = -i






