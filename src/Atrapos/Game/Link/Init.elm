module Atrapos.Game.Link.Init exposing (init)

import Common.Math exposing (len)
import Common.Dict exposing ((#))
import Atrapos.Game.Model exposing (..)


init : NodeId -> NodeId -> Nodes -> Link
init n1 n2 nodes =
    { node1 = n1
    , node2 = n2
    , len = len (nodes # n1) (nodes # n2) --|> round |> toFloat
    , selected = False
    }
