%{
  open Ast
%}

%token <Ast.constant> CST
%token <string> NAME
%token ADD DIV MUL MOD 

%token EQUAL
%token EOF
%token LPARENT RPARENT IGNORE COMMA
%token PRINT

%%


