module Run.Model exposing (Model(..))

import Run.Screens.Game.Model as Game


type Model
    = Splash
    | Game Game.Model
