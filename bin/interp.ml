open Ast

exception Error of string
let error s = raise (Error s)

let rec print (e: expr list): unit =
  match e with
  | EConst (CInt i) :: tl ->
    Printf.printf "%d" i;
    Printf.printf " ";
    print tl
  | EConst (CStr s) :: tl ->
    Printf.printf "%s" s;
    if String.get s (String.length s -1) <> '\n' then
      Printf.printf " ";
    print tl
  | [] -> Printf.printf "\n"
  (* | _ -> error "Failed to print this value";; *)

let rec interp (l: main)  = 
  match l with
  | SPrint e :: tl -> 
    print e;
    interp tl
  | SIgnore :: tl ->
    interp tl
  | [] -> ();;
