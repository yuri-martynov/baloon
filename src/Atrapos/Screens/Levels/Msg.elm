module Atrapos.Screens.Levels.Msg exposing (..)

import Http
import Atrapos.Screens.Levels.Model exposing (..)


type Msg
    = Loaded (Result Http.Error Levels)
    | Play LevelId
