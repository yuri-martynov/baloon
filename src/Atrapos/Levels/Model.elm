module Atrapos.Levels.Model exposing (..)

import Dict exposing (Dict)
import Atrapos.Data.Model exposing (Levels)


type alias Model =
    { levels : Levels
    , maxLevel : Int
    }
