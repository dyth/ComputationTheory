(*all the tokens required within Lambda Calculus*)
type token = Lambda
           | DotDelim
           | LPar
           | RPar
           | Var of string;;

  
(*read the file <name> and create a string list delimited by '\n'*)
let read name =
  let chan = open_in name
  in Std.input_list (chan);;


(*tokenise a list of strings ready for parsing*)
let rec lexer = function
  | (("a" :: T), "Lambd", list) -> lexer (T, "", (Lambda :: list))
  | (("." :: T), string, list)  -> lexer (T, "", (DotDelim :: Var(string) :: list))
  | (("(" :: T), string, list)  -> lexer (T, "", (LPar :: Var(string) :: list))
  | ((")" :: T), string, list)  -> lexer (T, "", (RPar :: Var(string) :: list))
  | ((" " :: T), string, list)  -> lexer (T, "", (Var(string) :: list))
  | ([]), string, list)         -> string :: list
  | ((H :: T), string, list)    -> lexer (T, H ^ string, list);;

  
(*open "lambda" as string by concatening the string list from read*)
let file = read "lambda";;
let file = String.concat "" file;;
Printf.printf "%s\n" file;;
