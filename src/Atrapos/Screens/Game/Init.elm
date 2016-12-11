module Atrapos.Screens.Game.Init exposing (init)

import Window 
import Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (Msg)

init: Window.Size -> (Model, Cmd Msg) 
init s =
    { windowSize = s
    , viewBoxWidth = 1000.0
    , settlements =  
        [ { player = 0, x = 250, y = 200, population = 4}
        , { player = 0, x = 50, y = 50, population = 1}
        , { player = 1, x = 300, y = 150, population = 4}
        , { player = 1, x = 230, y = 100, population = 4}
        , { player = 1, x = 450, y = 100, population = 4}
        ] 
            |> List.indexedMap (,)
            |> Dict.fromList
    , armies = Dict.empty
    , attack = NoAttack
    } ! []
