module Atrapos.Screens.Levels.Model exposing (..)

import Dict exposing (Dict)
import Common.WindowSize as WindowSize


type alias Model =
    { levels : Levels
    }

type alias LevelId =
    String


type alias Levels =
    Dict LevelId LevelTitle

type alias LevelTitle =
    { title: String}
