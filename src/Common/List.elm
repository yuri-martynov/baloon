module Common.List exposing (headBy, lst)

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
    [a]
