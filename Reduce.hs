module Reduce where

type VarName = String

data Term = Var VarName
          | Lam VarName Term
          | App Term Term
          deriving (Eq)

instance Show Term where
    show (Var x) = x
    show (Lam x t) = "(\\" ++ x ++ ". " ++ show t ++ ")"
    show (App t1 t2) = "(" ++ show t1 ++ " " ++ show t2 ++ ")"

-- Capture-avoiding substitution: [x := s] t
subst :: VarName -> Term -> Term -> Term
subst x s (Var y)
    | x == y    = s
    | otherwise = Var y
subst x s (Lam y t)
    | x == y    = Lam y t
    | otherwise = Lam y (subst x s t)
subst x s (App t1 t2) = App (subst x s t1) (subst x s t2)

-- Single step beta-reduction (Call-By-Value)
step :: Term -> Maybe Term
step (App (Lam x t12) v2) | isValue v2 = Just (subst x v2 t12)
step (App v1 t2) | isValue v1 = do
    t2' <- step t2
    return (App v1 t2')
step (App t1 t2) = do
    t1' <- step t1
    return (App t1' t2)
step _ = Nothing

isValue :: Term -> Bool
isValue (Lam _ _) = True
isValue (Var _)   = True
isValue _         = False

-- Full evaluation to Normal Form
eval :: Term -> Term
eval t = case step t of
    Just t' -> eval t'
    Nothing -> t
