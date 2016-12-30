module Atrapos.Levels.Msg exposing (..)

import Http
import Atrapos.Levels.Model exposing (..)


type Msg
    = LevelListLoaded (Result Http.Error Levels)

