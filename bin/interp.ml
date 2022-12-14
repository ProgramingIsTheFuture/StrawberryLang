open Ast

exception Error of string
let error s = raise (Error s)

let variables_store: (string, expr) Hashtbl.t = Hashtbl.create 1;;

let int_or_err = function 
  | CInt v -> v
  | _ -> error "Int was expected!"

let rec expr_val = function 
  | EConst (v) -> v
  | EOp v ->
    calculate_operator v
  | Evar n ->
    try
      expr_val (Hashtbl.find variables_store n)
    with _ ->
      error (Printf.sprintf "unbounded variable: %s\n" n)
and calculate_operator = function
  | Add (e1, e2) -> 
    let v1 = expr_val e1 in
    let v2 = expr_val e2 in
    begin 
      match (v1, v2) with
      | (CInt(val1), CInt(val2)) ->
        CInt (val1 + val2)
      | (CStr(val1), CStr(val2)) ->
        CStr (val1 ^ val2)
      | (CInt(val1), CStr(val2)) ->
        CStr ((string_of_int val1) ^ val2)
      | (CStr(val1), CInt(val2)) ->
        CStr (val1 ^ (string_of_int val2))
      | (CBool b1, CBool b2) ->
        CBool (b1 && b2)
      | _ ->
        error "Trying to combine incompatible value types"
    end
  | Mul (e1, e2) -> 
    let v1 = int_or_err (expr_val e1) in
    let v2 = int_or_err (expr_val e2) in
    CInt (v1 * v2)
  | Div (e1, e2) -> 
    let v1 = int_or_err (expr_val e1) in
    let v2 = int_or_err (expr_val e2) in
    CInt (v1 / v2)
  | Mod (e1, e2) -> 
    let v1 = int_or_err (expr_val e1) in
    let v2 = int_or_err (expr_val e2) in
    CInt (v1 mod v2)


let rec print (e: expr list): unit =
  match e with
  | ex :: tl ->
    let () = match (expr_val ex) with
    | CInt i ->
      Printf.printf "%d" i;
      Printf.printf " ";
    | CStr s ->
      Printf.printf "%s" s;
      if String.get s (String.length s -1) <> '\n' then
        Printf.printf " ";
    | CBool b ->
      Printf.printf "%b" b;
      Printf.printf " ";
    in
      print tl
  | [] -> Printf.printf "\n"
  ;;

let rec interp (l: main)  = 
  match l with
  | SPrint e :: tl -> 
    print e;
    interp tl
  | SDefine (name, e) :: tl ->
    Hashtbl.remove variables_store name;
    Hashtbl.add variables_store name e;
    interp tl
  | SIf (e1, s1, s2) :: tl ->

    begin match expr_val e1 with
    | CBool b ->
      if b then interp s1 else interp s2
    | _ -> error "Not a bool expression!"
    end;
    interp tl
  | SIgnore :: tl ->
    interp tl
  | [] -> ();;
