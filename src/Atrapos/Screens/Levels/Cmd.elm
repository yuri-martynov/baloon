module Atrapos.Screens.Levels.Cmd exposing (loadLevelList, loadLevel)

import Http
import Json.Decode exposing (Decoder, field, dict, list, int, string, map, map2)
import Common.Decode exposing (customDecoder)
import Atrapos.Screens.Levels.Model exposing (..)
import Atrapos.Screens.Levels.Msg exposing (Msg(LevelListLoaded, LevelLoaded))


loadLevelList : Cmd Msg
loadLevelList =
    Http.get "Db/levels.json" (dict decodeLevelTitle)
        |> Http.send LevelListLoaded

loadLevel : LevelId -> Cmd Msg
loadLevel id =
    Http.get ("Db/" ++ id ++ ".json") decodeLevel
        |> Http.send LevelLoaded



-- PRIVATES ----------

decodeLevelTitle: Decoder LevelTitle
decodeLevelTitle = 
    map LevelTitle
        (field "title" string)

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
