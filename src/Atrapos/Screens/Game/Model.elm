module Atrapos.Screens.Game.Model exposing (..)

import Dict exposing (Dict)
import Common.ViewBox as ViewBox
import Common.Types exposing (Location, Len_)


type alias Model =
    ViewBox.Model_
        { nodes : Nodes
        , links : Dict LinkId Link
        }


type alias NodeId =
    Int


type alias Nodes =
    Dict NodeId Node


type alias LinkId =
    Int


type alias Node =
    Location


type alias Link =
    Len_
        { node1 : NodeId
        , node2 : NodeId
        , selected : Bool
        }
