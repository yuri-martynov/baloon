module Atrapos.Screens.Game.Objects.Link.View exposing (view, stroke)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Json.Decode exposing (succeed)
import Common.Dict exposing (..)
import Atrapos.Screens.Game.Model exposing (Link, Node, Model)
import Atrapos.Screens.Game.Objects.Link.Msg exposing (..)



view : Model -> Link -> Svg Msg
view { nodes } { node1, node2, selected } =
    let
        n1 =
            nodes # node1

        n2 =
            nodes # node2

        class_ = 
            if selected then "selected"
            else ""
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

stroke =
    linearGradient [id "stroke"]
        [ stop [stopColor "silver"] []
        , stop [offset "100%", stopColor "transparent"] []
        ]