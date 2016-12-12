module Atrapos.Screens.Levels.Init exposing (init)

import Dict
import Window
import Atrapos.Screens.Levels.Model exposing (Model)
import Atrapos.Screens.Levels.Msg exposing (Msg)
import Atrapos.Screens.Levels.Cmd exposing (load)


init : Window.Size -> ( Model, Cmd Msg )
init s =
    { windowSize = s
    , levels = Dict.empty 
    } ! [load]
