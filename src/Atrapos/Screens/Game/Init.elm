module Atrapos.Screens.Game.Init exposing (init)

import Window 
import Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (Msg)

init: Window.Size -> (Model, Cmd Msg) 
init s =
    { windowSize = s
    , viewBoxWidth = 1000.0
    , nodes =  
        [ { x = 250, y = 200} 
        , { x = 50, y = 50}
        , { x = 300, y = 150}
        , { x = 230, y = 100}
        , { x = 450, y = 100}
        ] 
            |> List.indexedMap (,)
            |> Dict.fromList
    } ! []
