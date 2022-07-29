
(* The type of tokens. *)

type token = 
  | RPARENT
  | PRINT
  | LPARENT
  | IGNORE
  | EOF
  | CST of (Ast.constant)
  | COMMA
