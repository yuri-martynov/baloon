module Atrapos.Game.Node.View exposing (view)

import Dict
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Atrapos.Game.Model exposing (..)


view : Model_ -> NodeId -> Node -> Svg msg
view { links } id node =
    let
        class_ =
            if connected links id then
                "selected"
            else
                ""
    in
    --  TODO: make orbit red when not selected 
        image
            [ xlinkHref "Game/Node/star.svg"
            , width "1.5"
            , height "1.5"
            , node.x - 0.75 |> toString |> x
            , node.y - 0.75 |> toString |> y
            , class <| "node " ++ class_
            ]
            []



-- PRIVATE ---------------


connected : Links -> NodeId -> Bool
connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.any (\{ node1, node2 } -> node1 == id || node2 == id)
