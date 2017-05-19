module Extension where


data Constant = Constant Int

data Add left right = Add left right


{- allows to declare which types are instances of which class -}
class Expression x

instance Expression Constant

instance (Expression left, Expression right) => Expression (Add left right)



class Expression x => PrettyPrint x
  where
    prettyPrint :: x -> IO ()

instance PrettyPrint Constant
  where
    prettyPrint (Constant i) = do putStr (show i); putStr "\n"

instance (PrettyPrint left, PrettyPrint right) => PrettyPrint (Add left right)
  where
    prettyPrint (Add left right) = do
        prettyPrint left
        putStr " + "
        prettyPrint right



class Expression x => Evaluate x
   where
    evaluate :: x -> Int

instance Evaluate Constant
   where
     evaluate (Constant i) = i

instance (Evaluate left, Evaluate right) => Evaluate (Add left right)
   where
     evaluate (Add left right) = (evaluate left) + (evaluate right)