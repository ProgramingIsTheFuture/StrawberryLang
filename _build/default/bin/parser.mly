%start main

%type <Ast.main> main

%%

expr:
  | c = CST
    { EConst c }

params:
  | COMMA e = expr
    { e }

stmt:
  | PRINT LPARENT e1 = expr e2 = list(params)? RPARENT
    {
      match e2 with
      | Some v ->
        SPrint ([e1] @ v)
      | None ->
        SPrint [e1]
    }
  | IGNORE
    { SIgnore }


main:
  | st = list(stmt) EOF
    { st }
