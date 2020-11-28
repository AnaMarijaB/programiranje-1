type r3 = float * float * float
type 'a zaporedje = int -> 'a

type barve = |Zelena | Rdeca| Modra
let moje_barve barve list= [Rdeca; Zelena]

type tocka = { x : float; y : float }
type geometrijski_objekt =
  | Tocka of tocka
  | Daljica of tocka * tocka
  | Kroznica of { sredisce : tocka; radij : float }
  
let moji_objekti = [Tocka {x=1.; y= 0.}; Kroznica {sredisce = {x=1.; y= 0.}; radij = 4.}]

type ('a, 'b) vsota =
    | Prvi of 'a
    | Drugi of 'b

type naravno = 
    |Nic 
    |Nasl of naravno

let rec vsota m n =
  match m with
  | Nic -> n
  | Nasl m' -> vsota m' (Nasl n)

let rec produkt m n =
  match m with
  | Nic -> Nic
  | Nasl m' -> vsota n (produkt m' n)


let ena = Nasl Nic
let dva = vsota ena ena 
let stiri = produkt dva dva 

type 'a seznam =
  | Prazen
  | Sestavljen of 'a * 'a seznam