{
  open Lexing
  open Tokens

  exception SyntaxErr of string
}

rule tokens = parse
  | ' '
    { tokens lexbuf }
  | ['0'-'9']+ as s
    { CST (CInt (int_of_string s)) }
  | "strawberry" 
    { PRINT }
  | ','
    { COMMA }
  | '('
    { LPARENT}
  | ')'
    { RPARENT}
  | '\n'
    { new_line lexbuf; IGNORE }
  | eof
    { EOF }
  | _ 
    { raise 
      (SyntaxErr 
        (Printf.sprintf  
          "Failed to read character: [%c]\n" 
          (lexeme_char 
            lexbuf
            (lexeme_start lexbuf) 
          )
        )
      ) 
    }

