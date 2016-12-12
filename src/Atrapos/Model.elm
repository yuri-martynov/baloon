module Atrapos.Model exposing (Model(..))

import Atrapos.Screens.Game.Model as Game
import Atrapos.Screens.Levels.Model as Levels


type Model
    = Splash
    | Levels Levels.Model
    | Game Game.Model
