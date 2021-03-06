
(* ========== Vaja 1: Uvod v OCaml  ========== *)

(*----------------------------------------------------------------------------*]
 Funkcija [square] vrne kvadrat podanega celega števila.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # square 2;;
 - : int = 4
[*----------------------------------------------------------------------------*)

let rec square stevilo = stevilo * stevilo

(*----------------------------------------------------------------------------*]
 Funkcija [middle_of_triple] vrne srednji element trojice.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # middle_of_triple (true, false, true);;
 - : bool = false
[*----------------------------------------------------------------------------*)

let rec middle_of_triple x y z= 
  match (x,y,z) with
  |(prvi, drugi, tretji) -> drugi

let middle = function
  |(x,y,z) -> y


let srednji x y z = y

(*----------------------------------------------------------------------------*]
 Funkcija [starting_element] vrne prvi element danega seznama. V primeru
 prekratkega seznama vrne napako.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # starting_element [1; 2; 3; 4];;
 - : int = 1
[*----------------------------------------------------------------------------*)

let rec starting_element = function
  |[] -> failwith "Empty list had no starting element"
  |x::xs->x

let _= assert (starting_element[1; 2; 3; 4]=1) (*s tem primerjam če smo nardili prou nalogo, kukr print pr pythonu *)

(*----------------------------------------------------------------------------*]
 Funkcija [multiply] zmnoži vse elemente seznama. V primeru praznega seznama
 vrne vrednost, ki je smiselna za rekurzijo.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # multiply [2; 4; 6];;
 - : int = 48
[*----------------------------------------------------------------------------*)

let rec multiply sez= 
  match sez with
  |[]->1
  | x::xs -> x * multiply xs

(*----------------------------------------------------------------------------*]
 Napišite funkcijo ekvivalentno python kodi:

  def sum_int_pairs(pair_list):
      if len(pair_list) == 0:
        return []
      else:
        x, y = pair_list[0]
        return [x + y] + sum_int_pairs(pair_list[1:])

 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # sum_int_pairs [(1, -2); (3, 4); (0, -0)];;
 - : int list = [-1; 7; 0]
[*----------------------------------------------------------------------------*)

let rec sum_int_pairs1 seznam_parov =
  match seznam_parov with
  | a::xs -> (
    match a with
    | (x,y)-> (x + y) :: sum_int_pairs1 xs
  )
  | []-> []

let rec sum_int_pairs seznam_parov =
  match seznam_parov with
  | (a,b)::xs ->a+b:: sum_int_pairs xs 
  | []-> []

(*----------------------------------------------------------------------------*]
 Funkcija [get k list] poišče [k]-ti element v seznamu [list]. Številčenje
 elementov seznama (kot ponavadi) pričnemo z 0. Če je k negativen, funkcija
 vrne ničti element. V primeru prekratkega seznama funkcija vrne napako.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # get 2 [0; 0; 1; 0; 0; 0];;
 - : int = 1
[*----------------------------------------------------------------------------*)

let rec get1 k list =
  if k <= 0 then
    match list with
    |[] -> failwith "list too short"
    | x::xs -> x
  else
    match list with
    |[]-> failwith "list too short"
    | x::xs -> get1 (k-1) xs

let rec get k list =
  match list with
  | [] -> failwith "list too short"
  | x::xs -> if k<=0 then x else get (k-1) xs

(*----------------------------------------------------------------------------*]
 Funkcija [double] podvoji pojavitve elementov v seznamu.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # double [1; 2; 3];;
 - : int list = [1; 1; 2; 2; 3; 3]
[*----------------------------------------------------------------------------*)

let rec double sez = 
  match sez with
  | [] -> []
  | x :: xs -> x :: x :: double xs

let rec double1 sez =
  match sez with
  | [] -> []
  | x :: xs -> [x; x] @ double1 xs

(*----------------------------------------------------------------------------*]
 Funkcija [insert x k list] na [k]-to mesto seznama [list] vrine element [x].
 Če je [k] izven mej seznama, ga funkcija doda na začetek oziroma na konec.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # insert 1 3 [0; 0; 0; 0; 0];;
 - : int list = [0; 0; 0; 1; 0; 0]
 # insert 1 (-2) [0; 0; 0; 0; 0];;
 - : int list = [1; 0; 0; 0; 0; 0]
[*----------------------------------------------------------------------------*)

let rec insert x k list = 
  match list with
  | []->[x] 
  |y::ys ->
    if k<=0 then
      x::y::ys
    else
      y::(insert x (k-1) ys)

(*malo ekstra*)
let rec insert1 x k = function
  | []->[x]
  |y::ys when k<=0 -> x::y::ys
  |y::ys (*when k>0*) -> y::(insert1 x (k-1) ys)

(*TO NI OKEJ, TO JE NAPAKA KI JO ŠTUDENTI DOSTIKRAT DELAJO 
let rec x_is_in_list x = function
  |[] -> false
  | x::ys when x=y ->true
  |y::*)


(*----------------------------------------------------------------------------*]
 Funkcija [divide k list] seznam razdeli na dva seznama. Prvi vsebuje prvih [k]
 elementov, drugi pa vse ostale. Funkcija vrne par teh seznamov. V primeru, ko
 je [k] izven mej seznama, je primeren od seznamov prazen.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # divide 2 [1; 2; 3; 4; 5];;
 - : int list * int list = ([1; 2], [3; 4; 5])
 # divide 7 [1; 2; 3; 4; 5];;
 - : int list * int list = ([1; 2; 3; 4; 5], [])
[*----------------------------------------------------------------------------*)

let rec divide k list = 
  if k = 0 then ([], list) else
  match list with
  |[] -> ([], [])
  |x::xs -> 
    let (l1, l2) = divide (k-1) xs in 
    (x::l1, l2) 
 
(*----------------------------------------------------------------------------*]
 Funkcija [rotate n list] seznam zavrti za [n] mest v levo. Predpostavimo, da
 je [n] v mejah seznama.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # rotate 2 [1; 2; 3; 4; 5];;
 - : int list = [3; 4; 5; 1; 2]
[*----------------------------------------------------------------------------*)

let rec rotate n list =
  if n = 0 then list else
  match list with
  |[] -> []
  |x::xs -> rotate (n-1) (xs @ [x])

(*----------------------------------------------------------------------------*]
 Funkcija [remove x list] iz seznama izbriše vse pojavitve elementa [x].
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # remove 1 [1; 1; 2; 3; 1; 2; 3; 1; 1];;
 - : int list = [2; 3; 2; 3]
[*----------------------------------------------------------------------------*)

let rec remove x = function
  |[] -> []
  |a::b -> 
    if a=x then
      remove x b 
    else
      a:: remove x b  

(*----------------------------------------------------------------------------*]
 Funkcija [is_palindrome] za dani seznam ugotovi ali predstavlja palindrom.
 Namig: Pomagaj si s pomožno funkcijo, ki obrne vrstni red elementov seznama.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # is_palindrome [1; 2; 3; 2; 1];;
 - : bool = true
 # is_palindrome [0; 0; 1; 0];;
 - : bool = false
[*----------------------------------------------------------------------------*)

let rec is_palindrome list =
  list = List.rev list

(*----------------------------------------------------------------------------*]
 Funkcija [max_on_components] sprejme dva seznama in vrne nov seznam, katerega
 elementi so večji od istoležnih elementov na danih seznamih. Skupni seznam ima
 dolžino krajšega od danih seznamov.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # max_on_components [5; 4; 3; 2; 1] [0; 1; 2; 3; 4; 5; 6];;
 - : int list = [5; 4; 3; 3; 4]
[*----------------------------------------------------------------------------*)

let rec max_on_components l1 l2 =
  match l1 with
  |[]->l2
  |x::xs ->
    match l2 with
    |[]-> l1
    |y::ys ->
      if x >= y then
        x:: max_on_components xs ys
      else
        y:: max_on_components xs ys
  
let rec max_on_components1 l1 l2 =
  match l1, l2 with
  |[], []-> []
  |l1, [] -> l1
  |[], l2 -> l2
  |x::xs, y::ys ->
     if x >= y then
      if xs = [] then
        [x]
      else
        x:: max_on_components xs ys
    else
      if ys = [] then
        [y]
      else
        y:: max_on_components xs ys  


(*----------------------------------------------------------------------------*]
 Funkcija [second_largest] vrne drugo največjo vrednost v seznamu. Pri tem se
 ponovitve elementa štejejo kot ena vrednost. Predpostavimo, da ima seznam vsaj
 dve različni vrednosti.
 Namig: Pomagaj si s pomožno funkcijo, ki poišče največjo vrednost v seznamu.
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 # second_largest [1; 10; 11; 11; 5; 4; 10];;
 - : int = 10
[*----------------------------------------------------------------------------*)

let my_max = function
    [] -> invalid_arg "empty list"
  | x::xs -> List.fold_left max x xs

let rec second_largest list =  
  let m = my_max list in
  let sez = remove m list in
  my_max sez
