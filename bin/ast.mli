
type constant = 
  | CInt of int
  | CStr of string

type operator =
  | Add of expr * expr
  | Div of expr * expr
  | Mul of expr * expr
  | Mod of expr * expr
and 
expr =
  | EConst of constant
  | EOp of operator
  | Evar of string
and
stmt =
  | SPrint of expr list
  | SDefine of string * expr
  | SIgnore

type main = stmt list
