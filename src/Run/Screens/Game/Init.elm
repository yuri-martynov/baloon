module Run.Screens.Game.Init exposing (init)

import Window 
import Dict
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Msg exposing (Msg)

init: Window.Size -> (Model, Cmd Msg) 
init s =
    { windowSize = s
    , viewBoxWidth = 1000.0
    , settlements =  
        [ { player = 0, x = 50, y = 50, population = 4}
        , { player = 1, x = 100, y = 100, population = 2}
        ] 
            |> List.indexedMap (,)
            |> Dict.fromList
    } ! []
