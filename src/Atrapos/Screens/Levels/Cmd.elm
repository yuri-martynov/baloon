module Atrapos.Screens.Levels.Cmd exposing (load)

import Http
import Dict exposing (Dict)
import Json.Decode exposing (Decoder, field, dict, list, int, map2)
import Common.Decode exposing (customDecoder)
import Atrapos.Screens.Levels.Model exposing (..)
import Atrapos.Screens.Levels.Msg exposing (Msg(Loaded))


load : Cmd Msg
load =
    Http.get "screens/levels/levels.json" (dict decodeLevel)
        |> Http.send (mapResult >> Loaded)



-- PRIVATES ----------


mapResult : Result Http.Error (Dict String Level_) -> Result Http.Error Levels
mapResult result =
    case result of
        Err err ->
            Err err

        Ok levels ->
            levels |> Dict.map (always mapLevel) |> Ok


decodeLevel : Decoder Level_
decodeLevel =
    map2 Level_
        (field "nodes" decodeListx2)
        (field "links" decodeListx2)


type alias Level_ =
    { nodes : ListX2
    , links : ListX2
    }


type alias ListX2 =
    List (List Int)


decodeListx2 : Decoder ListX2
decodeListx2 =
    list (list int)


mapLevel : Level_ -> Level
mapLevel { nodes, links } =
    let
        node data =
            case data of
                [ n1, n2 ] ->
                    ( n1, n2 )

                _ ->
                    Debug.crash "node"

        link data =
            case data of
                n :: nn ->
                    ( n, nn )

                _ ->
                    Debug.crash "link"
    in
        { nodes = nodes |> List.map node
        , links = links |> List.map link
        }
