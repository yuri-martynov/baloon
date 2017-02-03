module Atrapos.Levels.Init exposing (init)

import Atrapos.Levels.Model exposing (Model)
import Atrapos.Levels.Msg exposing (Msg)
import Atrapos.Levels.Data exposing (data)


init : (Model, Cmd Msg)
init =
    { levels = data
    } ! []
