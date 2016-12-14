module Atrapos.Screens.Levels.Model exposing (..)

import Dict exposing (Dict)
import Common.WindowSize as WindowSize


type alias Model =
    WindowSize.Model
        { levels : Levels
        }


type alias Level =
    { nodes : List Node
    , links : List Link
    }


type alias Node =
    ( Int, Int )


type alias Link =
    ( Int, List Int )


type alias LevelId =
    String


type alias Levels =
    Dict LevelId LevelTitle

type alias LevelTitle =
    { title: String}
