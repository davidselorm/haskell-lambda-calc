# haskell-lambda-calc

A pure untyped lambda calculus interpreter and normal-order beta reduction engine in Haskell.

## Capabilities
- **AST Definitions**: Variable (`Var`), Abstraction (`Lam`), and Application (`App`).
- **Substitution**: Capture-avoiding substitution $[x := s]t$.
- **Evaluation**: Step-by-step beta reduction to normal form.
