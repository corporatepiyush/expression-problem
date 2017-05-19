module Main where

 type Shape = Square of side
            | Circle of radius


 define area = fun x -> case x of
    Square of side => (side * side)
  | Circle of radius => (3.14 *  radius * radius)
