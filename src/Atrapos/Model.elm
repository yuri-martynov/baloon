module Atrapos.Model exposing (Model(..))

import Atrapos.Screens.Game.Model as Game


type Model
    = Splash
    | Game Game.Model
