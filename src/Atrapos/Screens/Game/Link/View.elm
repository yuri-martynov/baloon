module Atrapos.Screens.Game.Link.View exposing (view, stroke)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Json.Decode exposing (succeed)
import Common.Dict exposing (..)
import Common.Svg exposing (..)
import Atrapos.Screens.Game.Model exposing (Link, Node, Model_, NodeId)
import Atrapos.Screens.Game.Link.Msg exposing (..)


view : Model_ -> Link -> Svg Msg
view { nodes } ({ node1, node2, selected, len } as link) =
    let
        n1 =
            nodes # node1

        n2 =
            nodes # node2

        class_ =
            if selected then
                "selected"
            else
                ""

        id_ =
            "link_" ++ (toString node1) ++ "_" ++ (toString node2)
    in
        [ Svg.path
            [ id_ |> id
            , dLine n1 n2 |> d
            -- , d <| "M" ++ (n1.x |> toString) ++ " " ++ (n1.y |> toString) ++ " L" ++ (n2.x |> toString) ++ " " ++ (n2.y |> toString)
            -- , onMouseDown Toggle
              -- , on "touchstart" (succeed Toggle)
            , "link " ++ class_ |> class
            ]
            []
        -- , text_
        --     [ class "len" ]
        --     [ [ len |> toString |> text ]
        --         |> textPath
        --             [ id_ |> (++) "#" |> xlinkHref
        --               , startOffset "50%"
        --             ]
        --     ]
        ]
            |> g []


stroke : Svg msg
stroke =
    linearGradient [ id "stroke" ]
        [ stop [ stopColor "silver" ] []
        , stop [ offset "100%", stopColor "transparent" ] []
        ]



-- PRIVATE ------------------
