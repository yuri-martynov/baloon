module Atrapos.Screens.Levels.Cmd exposing (load)

import Http
import Json.Decode exposing (Decoder, field, dict, list, int, map2)
import Common.Decode exposing (customDecoder)
import Atrapos.Screens.Levels.Model exposing (..)
import Atrapos.Screens.Levels.Msg exposing (Msg(Loaded))


load : Cmd Msg
load =
    Http.get "screens/levels/levels.json" (dict decodeLevel)
        |> Http.send Loaded



-- PRIVATES ----------


decodeLevel : Decoder Level
decodeLevel =
    map2 Level
        (field "nodes" (listOfList parseNode))
        (field "links" (listOfList parseLink))


parseNode : List Int -> Result String Node
parseNode data =
    case data of
        [ n1, n2 ] ->
            Ok ( n1, n2 )

        _ ->
            Err "node expected to be [int,int]"


parseLink : List Int -> Result String Link
parseLink data =
    case data of
        [n] ->
            Err "link expected to be [int, int, ...]"

        n :: nn ->
            Ok ( n, nn )

        [] ->
            Err "link can not be an empty array"


listOfList : (List Int -> Result String a) -> Decoder (List a)
listOfList =
    customDecoder (list int) >> list
