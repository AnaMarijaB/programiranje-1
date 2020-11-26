<<<<<<< HEAD
(* type barva = string *)

type barva =
  | Rdeca
  | Zelena
  | Modra

let moje_barve = [Rdeca; Zelena]

type geometrijski_objekt =
  | Tocka
  | Krog of float
  | Pravokotnik of float * float

type ('a, 'b) vsota =
  | Iota1 of 'a
  | Iota2 of 'b

let moji_objekti = [Iota1 Tocka; Iota1 Tocka; Iota2 Zelena; Iota1 (Krog 3.)]

let povrsina obj =
    match obj with
    | Tocka -> 0.
    | Krog r -> 3.14 *. r *. r
    | Pravokotnik (h, w) -> h *. w

type leto = Leto of int

let delno_definirana_povrsina (Krog r) = 3.14 *. r *. r

let koliko_let_je_minilo (Leto x) = 2019 - x

type cevelj = Cevelj of float
type meter = Meter of float

let razdalja_do_marsa = Meter 10000.
let hitrost_plovila_na_sekundo = Cevelj 1.

let pretvori_v_metre (Cevelj x) = Meter (0.3048 *. x)
let cas_v_sekundah (Meter razdalja) (Meter hitrost_na_sekundo) = razdalja /. hitrost_na_sekundo
let cas_potovanja = cas_v_sekundah razdalja_do_marsa (pretvori_v_metre hitrost_plovila_na_sekundo)

let nevarna_glava (x :: _) = x

let velika_glava xs = nevarna_glava xs > 100

let glava sez =
  match sez with
  | g :: rep -> Some g
  | [] -> None

let velika_glava xs = glava xs > 100

let deli m n =
  if n = 0 then None else Some (m / n)

let f x y z = x + (y / z)

let f x y z =
    match deli y z with
    | Some k -> Some (x + k)
    | None -> None
=======
type barva = string

let moje_barve : barva list = ["rdeča"; "modra"; "rumena"; "stol"]

let je_svetla (b : barva) : bool =
  match b with
  | "rumena" -> true
  | "modra" -> false
  | "rdeča" -> false
  | "črna" -> false
  | "rjava" -> false
  | _ -> true

let je_noc_svetla = je_svetla "zelo temna noč"

type barva' =
  | Rdeca
  | Zelena
  | Rumena
  | Modra

let moje_barve : barva' list = [Rdeca; Modra; Rumena; Stol]


type stanje_narocila =
  | VKosarici
  | Placano
  | Pripravljeno
  | Poslano
  | Prejeto

type tocka = { x : float; y : float }

type geometrijski_objekt =
  | Tocka of tocka
  | Daljica of tocka * tocka
  | Kroznica of { sredisce : tocka; radij : float }

let moja_slika = [
  Tocka {x = 0.; y = 0.};
  Daljica ({x = 0.; y = 0.}, {x = 1.; y = 1.});
  Daljica ({x = 0.; y = 0.}, {x = -1.; y = 1.});
  Kroznica {sredisce = {x = -1.; y = 1.}; radij = 2. ** 0.5}
]
let koliko_svincnika_potrebujem obj =
  match obj with
  | Tocka _ -> 0.
  | Daljica (p, q) -> ((p.x -. q.x) ** 2. +. (p.y -. q.y) ** 2.) ** 0.5
  | Kroznica k -> 3.14 *. k.radij ** 2.

type cevlji = Cevlji of float
type metri = Metri of float

let visina_donalda = Cevlji 6.
let visina_boruta = Metri 2.

let iz_cevljev_v_metre (Cevlji ft) = Metri (0.3048 *. ft)
let kdo_je_vecji =
  if iz_cevljev_v_metre visina_donalda > visina_boruta then
    "Donald"
  else
    "Borut"

type ('k, 'v) slovar = ('k * 'v) list

type 'a morebitni =
  | Nimamo
  | Imamo of 'a

let glava_seznama =
  function
  | [] -> Nimamo
  | x :: _ -> Imamo x

let dangerous_head =
  function
  | x :: _ -> x

let safe_head =
  function
  | [] -> None
  | x :: _ -> Some x

let big_dangerous_head lst =
  dangerous_head lst > 100

let big_safe_head lst =
  match safe_head lst with
  | Some hd -> hd > 100
  | None -> false


type int_ali_float =
| Int of int
| Float of float

let vsota x y =
match x, y with
| Int m, Int n -> Int (m + n)
| Int m, Float y -> Float (float_of_int m +. y)
>>>>>>> profrepo/master
