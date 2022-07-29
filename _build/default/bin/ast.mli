
type constant = 
  | CInt of int
  | CStr of string

type expr =
  | EConst of constant

type stmt =
  | SPrint of expr list
  | SIgnore

type main = stmt list
