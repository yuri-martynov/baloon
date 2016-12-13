module Atrapos.Screens.Levels.Model exposing (..)

import Dict exposing (Dict)
import Common.WindowSize as WindowSize


type alias Model =
    WindowSize.Model
        { levels : Levels
        }


type alias Level =
    { nodes : List ( Int, Int )
    , links : List ( Int, List Int )
    }


type alias LevelId =
    String


type alias Levels =
    Dict LevelId Level
