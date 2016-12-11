module Common.Dict exposing (..)

import Dict exposing (Dict)


justGet : comparable -> Dict comparable a -> a
justGet key dict =
    case dict |> Dict.get key of
        Just v ->
            v

        _ ->
            Debug.crash <| "id not found: " ++ (toString key)
