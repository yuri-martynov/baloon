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

        orbit =
            circle [ r "1", class "orbit orbit-1" ] []

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
            if connections then
                [ orbit ]
            else
                []
    in
        (planet :: orbits)
            |> g
                [ translate node
                , [ ( "selected", connections )
                  , ( "selection-start", start )
                  , ( "selection-end", end )
                  ]
                    |> classList
                ]



-- PRIVATE ---------------


connected : Links -> NodeId -> Bool
connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.any (\{ node1, node2 } -> node1 == id || node2 == id)


connectedWith : Links -> NodeId -> NodeId -> Bool
connectedWith links id1 id2 =
    links
        |> Dict.filter (always (not << .selected))
        |> Dict.values
        |> List.any (\{ node1, node2 } -> (node1 == id1 && node2 == id2) || (node1 == id2 && node2 == id1))
