module Atrapos.Data.Model exposing (..)

import Dict exposing (Dict)


type alias Model =
    { nodes : List Node
    , links : List Link
    }


type alias Node =
    ( Float, Float )


type alias Link =
    ( Int, List Int )


type alias Id =
    Int


type alias Levels =
    Dict Id Model
