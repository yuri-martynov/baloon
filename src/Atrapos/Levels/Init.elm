module Atrapos.Levels.Init exposing (init)

import Atrapos.Levels.Model exposing (Model)
import Atrapos.Levels.Msg exposing (Msg)
import Atrapos.Data.Levels as Levels


init : ( Model, Cmd Msg )
init =
    { levels = Levels.model
    }
        ! []
