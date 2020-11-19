type barve = |Zelena | Rdeca| Modra

type geometrijski_objekt = 
    | Tocka
    | Krog of float
    | Pravokotnik of float*float

type ('a, 'b) vsota =
    | Prvi of 'a
    | Drugi of 'b

let moji_objekti = [Prvi Tocka; Drugi Zelena; Prvi (Krog 3.)]