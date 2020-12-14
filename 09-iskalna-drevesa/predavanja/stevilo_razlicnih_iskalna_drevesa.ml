<<<<<<< HEAD:09-iskalna-drevesa/predavanja/stevilo_razlicnih_drevesa.ml
type 'a drevo =
  | Prazno
  | Sestavljeno of 'a drevo * 'a * 'a drevo

let prazna = Prazno

let rec velikost = function
  | Prazno -> 0
  | Sestavljeno (l, _, d) -> 1 + velikost l + velikost d

let rec vsebuje x = function
  | Prazno -> false
  | Sestavljeno (l, y, d) when x < y -> vsebuje x l
  | Sestavljeno (l, y, d) when x > y -> vsebuje x d
  | drevo -> true

let rec dodaj x = function
  | Prazno -> Sestavljeno (Prazno, x, Prazno)
  | Sestavljeno (l, y, d) when x < y -> Sestavljeno (dodaj x l, y, d)
  | Sestavljeno (l, y, d) when x > y -> Sestavljeno (l, y, dodaj x d)
  | drevo -> drevo

(* ------------------------------------------------------------------------- *)

let stevilo_razlicnih xs =
  let rec aux ze_videni = function
    | [] -> velikost ze_videni
    | x :: xs -> aux (dodaj x ze_videni) xs
  in
  aux prazna xs

let nakljucni_seznam m n = List.init n (fun _ -> Random.int m)
let seznam_zaporednih n = List.init n (fun i -> i)

let stopaj f x =
  let zacetek = Sys.time () in
  let y = f x in
  let konec = Sys.time () in
  print_endline ("Porabljen čas: " ^ string_of_float (1000. *. (konec -. zacetek)) ^ "ms");
  y

(* let primer = nakljucni_seznam 10000 10000 *)
let primer = seznam_zaporednih 10000

let n = stopaj stevilo_razlicnih primer

;;

Random.self_init ();
print_endline ("Število različnih: " ^ string_of_int n)
=======
type 'a drevo =
  | Prazno
  | Sestavljeno of 'a drevo * 'a * 'a drevo

let prazna_vreca = Prazno

let rec velikost = function
  | Prazno -> 0
  | Sestavljeno (l, _, d) -> 1 + velikost l + velikost d

let rec vsebuje x = function
  | Prazno -> false
  | Sestavljeno (l, y, d) ->
      if x = y then
        true
      else if x < y then
        vsebuje x l
      else
        vsebuje x d

let rec dodaj x = function
  | Prazno -> Sestavljeno (Prazno, x, Prazno)
  | Sestavljeno (l, y, d) ->
      if x = y then
        Sestavljeno (l, y, d)
      else if x < y then
        Sestavljeno (dodaj x l, y, d)
      else
        Sestavljeno (l, y, dodaj x d)
(* ------------------------------------------------------------------------- *)

let stevilo_razlicnih xs =
  let rec aux ze_videni = function
    | [] -> velikost ze_videni
    | x :: xs -> aux (dodaj x ze_videni) xs
  in
  aux prazna_vreca xs

let seznam_zaporednih n = List.init n (fun i -> i)
let nakljucni_seznam m n = List.init n (fun _ -> Random.int m)

let stopaj f x =
  let zacetek = Sys.time () in
  let y = f x in
  let konec = Sys.time () in
  print_endline ("Porabljen čas: " ^ string_of_float (1000. *. (konec -. zacetek)) ^ "ms");
  y

let _ = Random.self_init ()

(* let primer = nakljucni_seznam 100000 100000 *)
let primer = seznam_zaporednih 10000

let n = stopaj stevilo_razlicnih primer

let _ = print_endline ("Število različnih: " ^ string_of_int n)
>>>>>>> profrepo/master:09-iskalna-drevesa/predavanja/stevilo_razlicnih_iskalna_drevesa.ml
