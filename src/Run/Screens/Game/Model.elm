module Run.Screens.Game.Model exposing (Model)

import Window
import Dict exposing (Dict)
import Run.Screens.Game.Objects.Settlement.Model as Settlement


type alias Model =
    { windowSize : Window.Size
    , viewBoxWidth : Float
    , settlements : Dict Int Settlement.Model
    }
