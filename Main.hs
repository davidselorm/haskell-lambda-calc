module Main where

data Expr = Var String | Lam String Expr | App Expr Expr deriving (Show, Eq)

main :: IO ()
main = putStrLn "Lambda Calc Initialized."
