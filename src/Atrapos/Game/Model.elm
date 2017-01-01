module Atrapos.Game.Model exposing (..)

import Dict exposing (Dict)
import Mouse
import Common.ViewBox as ViewBox
import Common.Types exposing (Location, Len_)

type Model
    = Loading
    | Loaded Model_ 

type alias Model_ =
    ViewBox.Model_
        { nodes : Nodes
        , links : Links
        , minLen : Float
        , victory : Bool
        , selection : Selection
        , nodesTurned: Maybe Nodes
        , menu: Menu
        , swipe: Maybe Swipe
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

type alias SelectionModel =
    { lastNode : NodeId
    }

type alias DeselectionModel = 
    { startLocation: Location
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

type alias Menu = Bool

type alias Swipe = 
    Mouse.Position

