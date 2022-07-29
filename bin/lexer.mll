{
  open Lexing
  open Tokens

  exception SyntaxErr of string
  let string_buffer = Buffer.create 1024
}

rule tokens = parse
  | [' ' '\t']
    { tokens lexbuf }
  | '\n'
    { new_line lexbuf; IGNORE }
  | "🍓"
    { comments lexbuf }
  | "strawberry" 
    { PRINT }
  | ['0'-'9']+ as s
    { CST (CInt (int_of_string s)) }
  | '"'     
    { CST (CStr (string lexbuf)) }
  | ','
    { COMMA }
  | '('
    { LPARENT }
  | '+'
    { ADD }
  | '-'
    { SUB }
  | '/'
    { DIV }
  | '*'
    { MUL }
  | '%' 
    { MOD }
  | ')'
    { RPARENT }
  | eof
    { EOF }
  | _ as c
    { raise 
      (SyntaxErr 
        (Printf.sprintf "Iligal character %c" c)
      ) 
    }

and string = parse
  | '"'
    { 
      let s = Buffer.contents string_buffer in
	    Buffer.reset string_buffer;
      s 
    }
  | "\\n"
    { 
      Buffer.add_char string_buffer '\n';
	    string lexbuf 
	  }
  | "\\\""
    { 
      Buffer.add_char string_buffer '"';
      string lexbuf 
    }
  | _ as c
    {
      Buffer.add_char string_buffer c;
	    string lexbuf 
	  }
  | eof
    { 
      raise (SyntaxErr "unterminated string") 
    }

and comments = parse
  | '\n'
    { new_line lexbuf; IGNORE }
  | _
    { comments lexbuf }

