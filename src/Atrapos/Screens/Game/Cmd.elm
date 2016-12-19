module Atrapos.Screens.Game.Cmd exposing (Level, load)

import Http
import Task exposing (Task)
import Json.Decode exposing (Decoder, field, dict, list, int, string, map, map2)
import Common.Decode exposing (customDecoder)
import Atrapos.Screens.Levels.Model exposing (LevelId)

type alias Level =
    { nodes : List Node
    , links : List Link
    }


type alias Node =
    ( Int, Int )


type alias Link =
    ( Int, List Int )

load : LevelId -> Task Http.Error Level
load id =
    Http.get ("Db/" ++ id ++ ".json") decodeLevel
        |> Http.toTask
        -- |> Http.send msg


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
