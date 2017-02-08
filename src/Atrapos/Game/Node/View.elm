module Atrapos.Game.Node.View exposing (view)

import Dict
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Atrapos.Game.Model exposing (..)
import Common.Svg exposing (classList)
import Common.Transform exposing (translate)


view : Model_ -> NodeId -> Node -> Svg msg
view { links, selection } id node =
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

        ( start, end ) =
            case selection of
                Selection { lastNode } ->
                    if lastNode == id then
                        ( True, False )
                    else
                        ( False, id |> connectedWith links lastNode )

                _ ->
                    ( False, False )

        orbits =
            List.range 1 connections
                |> List.map orbit
    in
        (planet :: orbits)
            |> g
                [ translate node
                , [ ( "selected", connections > 0 )
                  , ( "selection-start", start )
                  , ( "selection-end", end )
                  ]
                    |> classList
                ]



-- PRIVATE ---------------


connected : Links -> NodeId -> Int
connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.filter (\{ node1, node2 } -> node1 == id || node2 == id)
        |> List.length


connectedWith : Links -> NodeId -> NodeId -> Bool
connectedWith links id1 id2 =
    links
        |> Dict.filter (always (not << .selected))
        |> Dict.values
        |> List.any (\{ node1, node2 } -> (node1 == id1 && node2 == id2) || (node1 == id2 && node2 == id1))
