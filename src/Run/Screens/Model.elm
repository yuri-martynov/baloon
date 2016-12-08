module Run.Screens.Game.Model exposing (Model)

import Window


type alias Model =
    { windowSize : Window.Size
    , viewBoxWidth : Float
    }
