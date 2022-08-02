let help_info = 
  "strawberry [file.strawberry]\nIf the file is empty it will open the interpreter"

let interp ?(file=stdin) ?(code="") () =
  let l = 
    if code = "" then
      Lexing.from_channel file 
    else 
      Lexing.from_string code in
  let f = Parser.main Lexer.tokens l in
  Interp.interp f;;

let () =
  let filename = ref "" in
  Arg.parse [] (fun f -> filename := f) help_info;
  if !filename <> "" then
    let file = open_in !filename in
    interp ~file ()
  else 
    let read_l () =
      let () = Printf.printf ">" in
      read_line () in

    let rec h c =
      if c <> "close()" then
        let () = 
          try
            interp ~code:c ()
          with e ->
            match e with
            | _ -> Printf.printf "Syntax error!\n" in
        h (read_l ()) in
    h (read_l ());;
