module Run.Model exposing (Model, Screen(..))

import Run.Screens.Game.Model as Game


type alias Model =
    { screen : Screen
    }


type Screen
    = Splash
    | Game Game.Model
