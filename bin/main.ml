

let () =
  let file = open_in "main.strawberry" in
  let l = Lexing.from_channel file in
  let f = Parser.main Lexer.tokens l in
  Interp.interp f;;
