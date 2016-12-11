module Atrapos.Screens.Game.Msg exposing (..)

import Common.Types exposing (Location)
import Atrapos.Screens.Game.Objects.Node.Msg as Node
import Atrapos.Screens.Game.Model exposing (NodeId)


type Msg
    = NodeMsg NodeId Node.Msg
 