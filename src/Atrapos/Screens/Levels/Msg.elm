module Atrapos.Screens.Levels.Msg exposing (..)

import Http
import Atrapos.Screens.Levels.Model exposing (..)


type Msg
    = LevelListLoaded (Result Http.Error Levels)

