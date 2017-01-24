module Atrapos.Game.Node.View exposing (view)

import Dict
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Atrapos.Game.Model exposing (..)
import Common.Svg exposing (classList)
import Common.Transform exposing (translate)


view : Model_ -> NodeId -> Node -> Svg msg
view { links } id node =
    let
        connections =
            connected links id

        planet =
            circle [ r "1", class "planet" ] []

        orbit n =
            [ circle [ r "1" ] []
            , circle [ r "0.1", cx "1", class "sputnik" ] []
            ]
                |> g
                    [ [ ( "orbit", True )
                      , ( "orbit-" ++ toString n, True )
                      ]
                        |> classList
                    ]

        orbits =
            List.range 1 connections
                |> List.map orbit
    in
        (planet :: orbits)
            |> g
                [ translate node
                , [ ( "selected", connections > 0 ) ] |> classList
                ]



-- PRIVATE ---------------


connected : Links -> NodeId -> Int
connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.filter (\{ node1, node2 } -> node1 == id || node2 == id)
        |> List.length
