module Run.Screens.Game.Init exposing (init)

import Window 
import Run.Screens.Game.Model exposing (Model)

init: Window.Size -> Model
init s =
    { windowSize = s
    , viewBoxWidth = 1000.0
    }
