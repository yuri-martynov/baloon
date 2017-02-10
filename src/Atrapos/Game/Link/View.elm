module Atrapos.Game.Link.View exposing (view, stroke)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Lazy exposing (lazy3)
import Common.Dict exposing (..)
import Atrapos.Game.Model exposing (Link, Node, Model_, NodeId)


view : Model_ -> Link -> Svg msg
view { nodes } ({ node1, node2, selected, len } as link) =
    let
        n1 =
            nodes # node1

        n2 =
            nodes # node2

        class_ =
            if selected then
                "link selected"
            else
                "link"

        line_ from to class_ =
            line
                [ from.x |> toString |> x1
                , from.y |> toString |> y1
                , to.x |> toString |> x2
                , to.y |> toString |> y2
                , class class_
                ]
                []
    in
        lazy3 line_ n1 n2 class_


stroke : Svg msg
stroke =
    linearGradient [ id "stroke" ]
        [ stop [ stopColor "silver" ] []
        , stop [ offset "100%", stopColor "transparent" ] []
        ]



-- PRIVATE ------------------
