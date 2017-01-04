module Atrapos.Model exposing (Model(..))

import Atrapos.Game.Model as Game
import Atrapos.Levels.Model as Levels


type Model
    = NotFound
    | Levels Levels.Model
    | Game Game.Model
