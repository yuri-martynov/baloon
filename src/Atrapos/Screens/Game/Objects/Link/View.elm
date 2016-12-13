module Atrapos.Screens.Game.Objects.Link.View exposing (view, stroke)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Json.Decode exposing (succeed)
import Common.Dict exposing (..)
import Atrapos.Screens.Game.Model exposing (Link, Node, Model)
import Atrapos.Screens.Game.Objects.Link.Msg exposing (..)


view : Model -> Link -> Svg Msg
view { nodes } { node1, node2, selected, len } =
    let
        n1 = nodes # node1
        n2 = nodes # node2 
    in
        [ line_ n1 n2 selected
        , length len n1 n2
        ] |> g []


stroke : Svg msg
stroke =
    linearGradient [ id "stroke" ]
        [ stop [ stopColor "silver" ] []
        , stop [ offset "100%", stopColor "transparent" ] []
        ]



-- PRIVATE ------------------


line_ : Node -> Node -> Bool -> Svg Msg
line_ n1 n2 selected =
    let
        class_ =
            if selected then
                "selected"
            else
                ""
    in
        line
            [ n1.x |> toString |> x1
            , n1.y |> toString |> y1
            , n2.x |> toString |> x2
            , n2.y |> toString |> y2
            , onMouseDown Toggle
              -- , on "touchstart" (succeed Toggle)
            , "link " ++ class_ |> class
            ]
            []

length: Float -> Node -> Node -> Svg Msg
length len n1 n2 =
    text_
        [ (n1.x + n2.x) /2 |> toString |> x
        , (n1.y + n2.y) /2 |> toString |> y 
        , fontSize "2"
        ]
        [ len |> toString |> text ]