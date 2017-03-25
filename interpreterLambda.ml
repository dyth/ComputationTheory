(*all the tokens required within Lambda Calculus*)
type token = Lambda | Dot | LPar | RPar | Var of string;;

  
(*read the file <name> and create a string list delimited by '\n'*)
let read name =
  let chan = open_in name in
  Std.input_list (chan)
;;

  
(*explode a string into a list of characters*)
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

  
(*tokenise a list of strings ready for parsing*)
let rec lexer = function
  | (('a' :: t), "lambd") -> Lambda :: (lexer (t, ""))
  | (('.' :: t), "")      -> Dot :: (lexer (t, ""))
  | (('(' :: t), "")      -> LPar :: (lexer (t, ""))
  | ((')' :: t), "")      -> RPar :: (lexer (t, ""))
  | ((' ' :: t), "")      -> lexer (t, "")
  | ([], "")              -> []
  | (('.' :: t), string)  -> Var(string) :: Dot :: (lexer (t, ""))
  | (('(' :: t), string)  -> Var(string) :: LPar :: (lexer (t, ""))
  | ((')' :: t), string)  -> Var(string) :: RPar :: (lexer (t, ""))
  | ((' ' :: t), string)  -> Var(string) :: (lexer (t, ""))
  | ([], string)          -> [Var(string)]
  | ((h :: t), string)    -> lexer (t, string ^ (String.make 1 h))
;;


let printToken token =
  match token with
  | Lambda       -> Printf.printf "Lambda\n"
  | Dot          -> Printf.printf "Dot\n"
  | LPar         -> Printf.printf "LPar\n"
  | RPar         -> Printf.printf "RPar\n"
  | Var (string) -> Printf.printf "%s\n" string
;;


(*open "lambda", as char list, then tokenise*)
let file = read "lambda";;
let file = String.concat "" file;;
let file = explode file;;
let tokens = lexer (file, "");;
List.map printToken tokens;;
