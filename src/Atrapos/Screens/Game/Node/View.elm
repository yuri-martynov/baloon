module Atrapos.Screens.Game.Node.View exposing (view)

import Dict
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Common.Transform as Transform
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Node.Msg exposing (..)


view : Model -> NodeId -> Node -> Svg Msg
view { links } id node =
    let
        class_ =
            if connected links id then
                "selected"
            else
                ""
    in
        circle [ r "0.5", class <| "node " ++ class_ ] []
            |> Transform.translate node



-- PRIVATE ---------------


connected : Links -> NodeId -> Bool
connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.any (\{ node1, node2 } -> node1 == id || node2 == id)
