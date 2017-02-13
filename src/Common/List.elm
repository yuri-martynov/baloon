module Common.List exposing (..)


headBy : (a -> Bool) -> List a -> List a
headBy predicate list =
    let
        headBy_ list acc =
            case list of
                [] ->
                    acc

                head :: tail ->
                    if (predicate head) then
                        head :: (tail ++ acc)
                    else
                        headBy_ tail (head :: acc)
    in
        headBy_ list []


lst a =
    [ a ]


crossCheck: (a -> a -> Bool) -> List a -> Bool
crossCheck  predicate list =
    case list of
        [] -> True
        [a] -> True
        a :: b :: tail ->
            if predicate a b then
                crossCheck predicate (b :: tail)
            else 
                False
      
