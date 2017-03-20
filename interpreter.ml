open Core.Std

let add x = x + 1;;

let x = add 3;;

Printf.printf "%d\n" x;;

let read name =
    let chan = open_in name in
    Std.input_list (chan);;
  
let file = read "register";;
  
List.map (Printf.printf "%s\n") file;;
