module Common.Dict exposing (..)

import Dict exposing (Dict)


justGet : comparable -> Dict comparable a -> a
justGet key dict =
    case dict |> Dict.get key of
        Just v ->
            v

        _ ->
            Debug.crash <| "id not found: " ++ (toString key)


(#) : Dict comparable a -> comparable -> a
(#) =
    flip justGet


(@) : Dict comparable a -> (comparable -> a -> b) -> List b
(@) dict map =
    dict |> Dict.map map |> Dict.values
