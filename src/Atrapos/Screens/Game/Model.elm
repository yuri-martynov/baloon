module Atrapos.Screens.Game.Model exposing (..)

import Dict exposing (Dict)
import Common.ViewBox as ViewBox
import Common.Types exposing (Location, Len_)


type alias Model =
    ViewBox.Model_
        { nodes : Nodes
        , links : Links
        , minLen : Float
        , victory : Bool
        , selection : Maybe Selection
        }


type alias Node =
    Location


type alias Link =
    Len_
        { node1 : NodeId
        , node2 : NodeId
        , selected : Bool
        }


type alias Selection =
    { lastNode : Maybe NodeId
    }

type alias Solution =
    List LinkId


type alias NodeId =
    Int


type alias Nodes =
    Dict NodeId Node


type alias Links =
    Dict LinkId Link


type alias LinkId =
    Int
