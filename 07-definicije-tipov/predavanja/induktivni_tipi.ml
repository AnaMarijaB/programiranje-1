<<<<<<< HEAD
type 'a seznam =
  | Prazen
  | Sestavljen of 'a * 'a seznam

let rec map f = function
  | Prazen -> Prazen
  | Sestavljen (glava, rep) -> Sestavljen (f glava, map f rep)

type naravno =
  | Nic
  | Naslednik of naravno

let rec sestej m n =
  match m, n with
  | Nic, Nic -> Nic
  | Nic, Naslednik n' -> Naslednik n'
  | Naslednik m', Nic -> Naslednik m'
  | Naslednik m', Naslednik n' -> Naslednik (Naslednik (sestej m' n'))

let rec sestej m n =
  match m with
  | Nic -> n
  | Naslednik m' -> Naslednik (sestej m' n)

let sestej m n =
  let rec aux acc = function
  | Nic -> acc
  | Naslednik m -> aux (Naslednik acc) m
  in
  aux n m

let rec zmnozi m n =
  match m with
  | Nic -> Nic
  | Naslednik m' -> sestej (zmnozi m' n) n

let zmnozi m n =
  let rec aux acc = function
  | Nic -> acc
  | Naslednik m -> aux (sestej acc n) m
  in
  aux Nic m

(* (m'+1) * n = m' * n + n *)
let ena = Naslednik Nic
let dva = Naslednik (Naslednik Nic)
let stiri = zmnozi dva dva
let sest = sestej stiri dva
let sedem = Naslednik sest

(* iz_naravnega (Naslednik (Naslednik Nic)) = 2 *)
(* v_naravno 2 = Some (Naslednik (Naslednik Nic)) *)
(* v_naravno -3 = None *)

type 'a drevo =
  | Prazno
  | Sestavljeno of 'a drevo * 'a * 'a drevo

let rec stevilo_vozlisc = function
  | Prazno -> 0
  | Sestavljeno (l, x, d) -> 1 + stevilo_vozlisc l + stevilo_vozlisc d

let rec globina = function
  | Prazno -> 0
  | Sestavljeno (l, x, d) -> 1 + max (globina l) (globina d)

let rec seznam_elementov = function
  | Prazno -> []
  | Sestavljeno (l, x, d) ->
      seznam_elementov l @ [x] @ seznam_elementov d
=======
type naravno =
  | Nic
  | Nasl of naravno

let ena = Nasl Nic

let rec vsota m n =
  match m with
  | Nic -> n
  | Nasl m' -> vsota m' (Nasl n)  (* pozor, ni standardno, je pa repno-rekurzivno *)

let rec zmnozi m n =
  match m with
  | Nic -> Nic
  | Nasl m' -> vsota n (zmnozi m' n)

let dva = vsota ena ena
let stiri = zmnozi dva dva

type 'a seznam =
  | Prazen
  | Sestavljen of 'a * 'a seznam

(* type ('a, 'b) izmenjujoci_seznam =
  | Prazen
  | Sestavljen of 'a * ('b, 'a) izmenjujoci_seznam *)

let rec vsota sez =
    match sez with
    | Prazen -> 0
    | Sestavljen (glava, rep) -> glava + vsota rep

let rec dolzina sez =
    match sez with
    | Prazen -> 0
    | Sestavljen (_, rep) -> 1 + dolzina rep

(* [1; 2; 3] ... 1 :: 2 :: 3 :: [] *)
(* [1, 2, 3] ... Sestavljen (1, Sestavljen (2, Sestavljen (3, Prazen))) *)
let rec stakni sez1 sez2 =
    match sez1 with
    | [] -> sez2
    | glava1 :: rep1 -> glava1 :: stakni rep1 sez2

let rec preslikaj f sez =
    match sez with
    | [] -> []
    | glava :: rep -> f glava :: preslikaj f rep

let rec v_slovenscino =
  function
  | [] -> Prazen
  | glava :: rep -> Sestavljen (glava, v_slovenscino rep)
>>>>>>> profrepo/master
