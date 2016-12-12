module Atrapos.Screens.Game.Solution exposing (solution, apply)

import Dict exposing (Dict)
import Common.List as List
import Atrapos.Screens.Game.Model exposing (..)


solution : Model -> List LinkId
solution ({ nodes, links } as model) =
    let
        step edges acc =
            case edges of
                [] ->
                    acc

                (( _, n1, n2 ) as head) :: tail ->
                    if path n1 n2 acc then
                        step tail acc
                    else
                        step tail (head :: acc)
    in
        step (orderedByLen links) []
            |> List.map (\( id, _, _ ) -> id)


apply : Model -> Model
apply model =
    let
        solution_ =
            solution model

        links_ =
            model.links |> Dict.map (\id link -> { link | selected = solution_ |> List.member id })
    in
        { model | links = links_ }



-- PRIVATE ---------------------


orderedByLen : Dict LinkId Link -> List ( LinkId, NodeId, NodeId )
orderedByLen =
    Dict.toList
        >> List.sortBy (Tuple.second >> .len)
        >> List.map (\( id, { node1, node2 } ) -> ( id, node1, node2 ))


path : NodeId -> NodeId -> List ( LinkId, NodeId, NodeId ) -> Bool
path n1 n2 edges =
    case edges |> List.headBy (\( _, m1, _ ) -> n1 == m1) of
        [] ->
            False

        ( _, m1, m2 ) :: tail ->
            let
                path_ m1 m2 =
                    if (n1 == m1) then
                        if (n2 == m2) then
                            True
                        else
                            path m2 n2 tail
                    else
                        path n1 n2 tail
            in
                path_ m1 m2 || path_ m2 m1
