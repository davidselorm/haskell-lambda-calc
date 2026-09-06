module Reduce where
import Main

subst :: String -> Expr -> Expr -> Expr
subst x s (Var y) | x == y    = s
                  | otherwise = Var y
subst x s (Lam y e) | x == y    = Lam y e
                    | otherwise = Lam y (subst x s e)
subst x s (App e1 e2) = App (subst x s e1) (subst x s e2)
