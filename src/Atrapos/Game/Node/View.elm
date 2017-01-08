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
        -- image
        --     [ xlinkHref "Game/Node/star.svg"
        --     , width "1.5"
        --     , height "1.5"
        --     , node.x - 0.75 |> toString |> x
        --     , node.y - 0.75 |> toString |> y
        --     , class <| "node " ++ class_
        --     ]
        --     []
        g [] 
        [
            circle
        [ fill "#58E5FF", cx "0", cy "0", r "0.5", opacity "0.8"
        , transform ("matrix(1 0 0 1 " ++ toString node.x  ++ " " ++ toString node.y ++ ")") 
        -- , class <| "node " ++ class_
        ]
        []
        ,circle
        [ fill "none", stroke "red", cx "0", cy "0", r "1", strokeWidth "0.05", opacity "0.8"
        , transform ("matrix(1 0 0 1 " ++ toString node.x  ++ " " ++ toString node.y ++ ")") 
        , class <| "node orbit " ++ class_
        ]
        []
        ]
        -- circle
        -- [ fill "#58E5FF", cx "0", cy "0", r "0.5"
        -- , transform ("matrix(1 0 0 1 " ++ toString node.x  ++ " " ++ toString node.y ++ ")") 
        -- , class <| "node " ++ class_
        -- ]
        -- []



-- PRIVATE ---------------


connected : Links -> NodeId -> Bool
connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.any (\{ node1, node2 } -> node1 == id || node2 == id)
