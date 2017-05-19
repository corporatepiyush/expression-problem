module Inherit where

type Vector3D = (Double, Double, Double)

class Shape shape where
    name :: shape -> String
    position :: shape -> Vector3D

data Sphere = Sphere {
    sphereName :: String,
    spherePosition :: Vector3D,
    sphereRadius :: Double
}

data Prism = Prism {
    prismName :: String,
    prismPosition :: Vector3D,
    prismDimensions :: Vector3D
}

--deriving (Show)

instance Shape Sphere where
    name = sphereName
    position = spherePosition

instance Shape Prism where
    name = prismName
    position = prismPosition


instance Show Prism where
  show (Prism prismName prismPosition prismDimensions) = show prismName ++ "-" ++ show prismPosition ++ "-" ++ show prismDimensions

additionOfSquareOfNums :: [Int] -> Int
additionOfSquareOfNums a = let x = a in sum (map (* 2) x)