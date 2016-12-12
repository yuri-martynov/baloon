module Atrapos.Screens.Levels.Model exposing (..)

import Dict exposing (Dict)
import Window

type alias Model =
    { windowSize: Window.Size
    , levels : Levels
    }


type alias Level =
    { nodes : List ( Int, Int )
    , links : List ( Int, List Int )
    }


type alias LevelId =
    String


type alias Levels =
    Dict LevelId Level
