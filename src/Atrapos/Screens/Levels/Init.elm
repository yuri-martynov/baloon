module Atrapos.Screens.Levels.Init exposing (init)

import Dict
import Atrapos.Screens.Levels.Model exposing (Model)
import Atrapos.Screens.Levels.Msg exposing (Msg)
import Atrapos.Screens.Levels.Cmd exposing (load)


-- init : Model, Cmd Msg
init =
    { levels = Dict.empty 
    } ![load]
