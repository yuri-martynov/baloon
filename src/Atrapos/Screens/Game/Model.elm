module Atrapos.Screens.Game.Model exposing (..)

import Dict exposing (Dict)
import Common.ViewBox as ViewBox
import Common.Types exposing (Location)

type alias Model =
    ViewBox.Model_
        { nodes : Dict NodeId Node
        , links : Dict LinkId Link
        }


type alias NodeId =
    Int


type alias LinkId =
    Int


type alias Node =
    Location


type alias Link =
    { node1 : NodeId
    , node2 : NodeId
    , selected: Bool
    }
