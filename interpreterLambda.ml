(*all the tokens required within Lambda Calculus*)
type token = Lambda | Dot | LPar | RPar | Var of string;;

  
(*read the file <name> and create a string list delimited by '\n'*)
let read name =
  let chan = open_in name
  in Std.input_list (chan)
;;

  
(*explode a string into a list of characters*)
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

  
(*tokenise a list of strings ready for parsing*)
let rec lexer = function
  | (('a' :: t), "Lambd", list) -> lexer (t, "", (Lambda :: list))
  | (('.' :: t), string, list)  -> lexer (t, "", (Dot :: Var(string) :: list))
  | (('(' :: t), string, list)  -> lexer (t, "", (LPar :: Var(string) :: list))
  | ((')' :: t), string, list)  -> lexer (t, "", (RPar :: Var(string) :: list))
  | ((' ' :: t), string, list)  -> lexer (t, "", (Var(string) :: list))
  | ([], "", list)              -> list
  | ([], string, list)          -> Var(string) :: list
  | ((h :: t), string, list)    -> lexer (t, (String.make 1 h) ^ string, list)
;;

  
(*open "lambda" as string by concatening the string list from read*)
let file = read "lambda";;
let file = String.concat "" file;;
let file = explode file;;
let tokens = lexer (file, "", []);;
