type constant = 
  | CInt of int
  | CStr of string

type operator =
  | Neg of expr 
  | Add of expr * expr
  | Sub of expr * expr
  | Div of expr * expr
  | Mul of expr * expr
  | Mod of expr * expr
and 
expr =
  | EConst of constant
  | EOp of operator

type stmt =
  | SPrint of expr list
  | SIgnore

type main = stmt list
