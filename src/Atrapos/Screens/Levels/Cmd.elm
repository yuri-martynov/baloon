module Atrapos.Screens.Levels.Cmd exposing (load)

import Http
import Json.Decode exposing (Decoder, field, dict, list, int, string, map, map2)
import Atrapos.Screens.Levels.Model exposing (..)
import Atrapos.Screens.Levels.Msg exposing (Msg(LevelListLoaded))


load : Cmd Msg
load =
    Http.get "Db/levels.json" (dict decodeLevelTitle)
        |> Http.send LevelListLoaded


-- PRIVATES ----------

decodeLevelTitle: Decoder LevelTitle
decodeLevelTitle = 
    map LevelTitle
        (field "title" string)


