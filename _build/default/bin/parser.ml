
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = Tokens.token
  
end

include MenhirBasics

# 1 "bin/tokens.mly"
  
  open Ast

# 21 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState02 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 02.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState04 : ((('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : PRINT expr.
        Start symbol: main. *)

  | MenhirState05 : (('s, _menhir_box_main) _menhir_cell1_COMMA, _menhir_box_main) _menhir_state
    (** State 05.
        Stack shape : COMMA.
        Start symbol: main. *)

  | MenhirState07 : (('s, _menhir_box_main) _menhir_cell1_params, _menhir_box_main) _menhir_state
    (** State 07.
        Stack shape : params.
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_stmt, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : stmt.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_params = 
  | MenhirCell1_params of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (Ast.stmt)

and ('s, 'r) _menhir_cell1_COMMA = 
  | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINT = 
  | MenhirCell1_PRINT of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.main) [@@unboxed]

let _menhir_action_01 =
  fun c ->
    (
# 9 "bin/parser.mly"
    ( EConst c )
# 78 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 86 "bin/parser.ml"
     : (Ast.expr list))

let _menhir_action_03 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 94 "bin/parser.ml"
     : (Ast.expr list))

let _menhir_action_04 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 102 "bin/parser.ml"
     : (Ast.main))

let _menhir_action_05 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 110 "bin/parser.ml"
     : (Ast.main))

let _menhir_action_06 =
  fun st ->
    (
# 30 "bin/parser.mly"
    ( st )
# 118 "bin/parser.ml"
     : (Ast.main))

let _menhir_action_07 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 126 "bin/parser.ml"
     : (Ast.expr list option))

let _menhir_action_08 =
  fun x ->
    (
# 113 "<standard.mly>"
    ( Some x )
# 134 "bin/parser.ml"
     : (Ast.expr list option))

let _menhir_action_09 =
  fun e ->
    (
# 13 "bin/parser.mly"
    ( e )
# 142 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_10 =
  fun e1 e2 ->
    (
# 17 "bin/parser.mly"
    (
      match e2 with
      | Some v ->
        SPrint ([e1] @ v)
      | None ->
        SPrint [e1]
    )
# 156 "bin/parser.ml"
     : (Ast.stmt))

let _menhir_action_11 =
  fun () ->
    (
# 25 "bin/parser.mly"
    ( SIgnore )
# 164 "bin/parser.ml"
     : (Ast.stmt))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Tokens.COMMA ->
        "COMMA"
    | Tokens.CST _ ->
        "CST"
    | Tokens.EOF ->
        "EOF"
    | Tokens.IGNORE ->
        "IGNORE"
    | Tokens.LPARENT ->
        "LPARENT"
    | Tokens.PRINT ->
        "PRINT"
    | Tokens.RPARENT ->
        "RPARENT"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let st = _v in
      let _v = _menhir_action_06 st in
      MenhirBox_main _v
  
  let rec _menhir_run_14 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_stmt -> _ -> _menhir_box_main =
    fun _menhir_stack _v ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_05 x xs in
      _menhir_goto_list_stmt_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_stmt_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_16 _menhir_stack _v
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Tokens.LPARENT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Tokens.CST _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let c = _v in
              let _v = _menhir_action_01 c in
              let _menhir_s = MenhirState02 in
              let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
              (match (_tok : MenhirBasics.token) with
              | Tokens.COMMA ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
              | Tokens.RPARENT ->
                  let _v = _menhir_action_07 () in
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Tokens.CST _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let c = _v in
            _menhir_action_01 c
          in
          let e = _v in
          let _v = _menhir_action_09 e in
          let _menhir_stack = MenhirCell1_params (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | Tokens.COMMA ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
          | Tokens.RPARENT ->
              let _v = _menhir_action_02 () in
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_params -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_params (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_03 x xs in
      _menhir_goto_list_params_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_params_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState04 ->
          _menhir_run_11_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11_spec_04 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_08 x in
      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_09 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_expr (_menhir_stack, _, e1) = _menhir_stack in
      let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_10 e1 e2 in
      _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Tokens.PRINT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | Tokens.IGNORE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
      | Tokens.EOF ->
          let _v = _menhir_action_04 () in
          _menhir_run_14 _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Tokens.PRINT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | Tokens.IGNORE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | Tokens.EOF ->
          let _v = _menhir_action_04 () in
          _menhir_run_16 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
