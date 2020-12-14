let seznam = [1; 2; 3]
let f x =
    let seznam = x :: seznam in 
    List.length seznam
let g x = f x + f x 

