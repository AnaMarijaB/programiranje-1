let podvoji x = 2 * x
(*let pomnozi_s_pi x = 3.14 * x*)
let ali_je_tri_vecje_od_stiri = 3>4
let najboljse_stevilo = 42+1
let pomnozi_med_sabo x y = x * y;;

(*"to je niz"
če jih hočeš združevat med sabo uporabiš ^
"to je niz" ^"niz"*)

(*niz pišeš samo ed dvojne narekovaje, med enojne '' pišeš lahko samo en znak*)

let uporabi_dvakrat_na_nic f = f (f 0)

let pozdravi ime = 
    if ime = "Matija" then 
        "Pozdravljeni, gospod profesor!"
    else if ime="Filip" || ime ="Žiga" then
        "Pozdravljeni, gospod asistent!"
    else
        "Živjo, "^ime


let pozdravi_z_match ime =
    match ime with
        |"Matija" -> "Pozdravljeni, gospod profesor!"
        |"Filip"| "Žiga" -> "Pozdravljeni, gospod asistent!"
        | _ -> "Živjo, "^ime

(*seatvljanje seznamov: 1 :: 2 :: 3 :: [];; *)

let je_seznam_prazen sez = 
    match sez with
    |[] -> true
    |_::_ -> false


(*če hočeš v Ocamlu eksplicitno definicijo moreš dodat zravn rec *)
let rec vsota sez =
    match sez with
    | [] -> 0
    |glava::rep -> glava + vsota rep

let rec dolzina sez =
    match sez with
    | []->0
    |glava::rep-> 1+dolzina rep

(*1,2 je nabor in vrne (1,2) *)

(*[1;2;3]@[4;5;6] da vn [1;2;3;4;5;6] 
definiramo sami to funkcijo*)

let rec stakni sez1 sez2 =
    match sez1 with
    | []-> sez2
    | glava1 :: rep1 -> glava1 :: stakni rep1 sez2

(*[1;2]::[3;4]  to ni okej ker hočeš neki kar je tipa seznam dat v seznam ki ima tiš int
 1::2::3::[] je OKEJ
 1::2::3 ni okej 
 1::2::[3] je okej
 [1;2]@[3;4] je tudi OKEJ
 1@[2;3] ni okej ker alfra pričakuje na obeh straneh sezname
 [1;2]@[] je okej
 [1;2]::[] je okej in dobimo seznam seznamov*)


(*VAJE:
function nadomesti x y z= match (x,y,z) with


def f(x):
    y=x+100
    
    return y

v ocamlu: let f x=
                let y=x+100 in
                x + y *)

