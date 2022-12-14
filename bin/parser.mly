%start main

%type <Ast.main> main

%%

expr:
  | c = CST
    { EConst c }
  | c = NAME
    {Evar c}
  | LPARENT e1 = expr RPARENT
    { e1 }
  | e1 = CST e2 = CST
    { EOp (Add (EConst e1, EConst e2)) }
  | e1 = expr ADD e2 = expr
    { EOp (Add (e1, e2)) }
  | e1 = expr MUL e2 = expr
    { EOp (Mul (e1, e2)) }
  | e1 = expr DIV e2 = expr
    { EOp (Div (e1, e2)) }
  | e1 = expr MOD e2 = expr
    { EOp (Mod (e1, e2)) }

params:
  | COMMA e = expr
    { e }

stmt:
  | PRINT LPARENT e1 = expr e2 = list(params)? RPARENT
    {
      match e2 with
      | Some v ->
        SPrint (e1 :: v)
      | None ->
        SPrint [e1]
    }
  | c = NAME EQUAL e1 = expr
    { SDefine (c, e1) }
  | e1 = expr INTERROG s1 = list(stmt) DOUBLEDOT s2 = list(stmt)
    { SIf (e1, s1, s2) }
  | IGNORE
    { SIgnore }


main:
  | st = list(stmt) EOF
    { st }
