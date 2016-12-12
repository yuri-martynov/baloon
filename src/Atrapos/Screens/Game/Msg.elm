module Atrapos.Screens.Game.Msg exposing (..)

import Atrapos.Screens.Game.Objects.Node.Msg as Node
import Atrapos.Screens.Game.Objects.Link.Msg as Link
import Atrapos.Screens.Game.Model exposing (NodeId, LinkId)


type Msg
    = NodeMsg NodeId Node.Msg
    | LinkMsg LinkId Link.Msg
    | Help
 