module Atrapos.Game.Model exposing (..)

import Dict exposing (Dict)
import Common.ViewBox as ViewBox
import Common.Types exposing (Location, Len_)
import Atrapos.Levels.Model exposing (LevelId)


type Model
    = Loading LevelId
    | Loaded Model_


type alias Model_ =
    ViewBox.Model_
        { nodes : Nodes
        , links : Links
        , minLen : Float
        , victory : Bool
        , selection : Selection
        , menu : Menu
        }


type alias Node =
    Location


type alias Link =
    Len_
        { node1 : NodeId
        , node2 : NodeId
        , selected : Bool
        }


type Selection
    = None
    | Selection SelectionModel
    | Deselection DeselectionModel


type alias EndLocation a =
    { a 
        | endLocation : Location
    }

type alias SelectionModel =
    EndLocation
        { lastNode : NodeId
        }


type alias DeselectionModel =
    EndLocation
        { startLocation : Location
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


type alias Menu =
    Bool

