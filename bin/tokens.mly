%{
  open Ast
%}

%token <Ast.constant> CST
%token ADD SUB DIV MUL MOD 

%token EOF
%token LPARENT RPARENT IGNORE COMMA
%token PRINT

%%


