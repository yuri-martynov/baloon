module Atrapos.Screens.Game.Msg exposing (..)

import Common.Types exposing (Location)
import Atrapos.Screens.Game.Node.Msg as Node
import Atrapos.Screens.Game.Link.Msg as Link
import Atrapos.Screens.Game.Model exposing (NodeId, LinkId)


type Msg
    = NodeMsg NodeId Node.Msg
    | LinkMsg LinkId Link.Msg
    | Help
    | Reset
    | Mouse MouseMsg


type MouseMsg
    = Down
    | Move Location
    | Up
