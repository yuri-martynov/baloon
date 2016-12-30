module Atrapos.Game.Link.View exposing (view, stroke)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Common.Dict exposing (..)
import Common.Svg exposing (..)
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
                "selected"
            else
                ""

        id_ =
            "link_" ++ (toString node1) ++ "_" ++ (toString node2)
    in
        [ Svg.path
            [ id_ |> id
            , dLine n1 n2 |> d
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
