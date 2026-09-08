module Main where

import Reduce

main :: IO ()
main :: IO ()
main = do
    putStrLn "=== Untyped Lambda Calculus Evaluator ==="
    -- (\x. x) y --> y
    let idExp = Lam "x" (Var "x")
    let appExp = App idExp (Var "y")
    putStrLn $ "Original: " ++ show appExp
    putStrLn $ "Reduced:  " ++ show (eval appExp)
