module Atrapos.Levels.Init exposing (init)

import Dict
import Atrapos.Levels.Model exposing (Model)
import Atrapos.Levels.Msg exposing (Msg)
import Atrapos.Levels.Cmd exposing (load)


-- init : Model, Cmd Msg


init =
    { levels = Dict.empty
    }
        ! [ load ]
