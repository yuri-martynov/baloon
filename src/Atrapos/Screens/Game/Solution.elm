module Atrapos.Screens.Game.Solution exposing (solution, apply)

import Dict exposing (Dict)
import Common.List as List
import Atrapos.Screens.Game.Model exposing (..)


solution : Nodes -> Links -> Solution
solution nodes links =
    links
        |> orderedByLen
        |> flip solution_ []
        |> List.map (\( id, _, _ ) -> id)


apply : Model_ -> Model_
apply model =
    let
        solution_ =
            solution model.nodes model.links

        links_ =
            model.links
                |> Dict.map (\id link -> { link | selected = solution_ |> List.member id })
    in
        { model | links = links_ }



-- PRIVATE ---------------------


type alias Links_ =
    List ( LinkId, NodeId, NodeId )


orderedByLen : Links -> Links_
orderedByLen =
    Dict.toList
        >> List.sortBy (Tuple.second >> .len)
        >> List.map (\( id, { node1, node2 } ) -> ( id, node1, node2 ))


solution_ : Links_ -> Links_ -> Links_
solution_ edges acc =
    case edges of
        [] ->
            acc

        (( _, n1, n2 ) as head) :: tail ->
            if path n1 n2 acc then
                solution_ tail acc
            else
                solution_ tail (head :: acc)


path : NodeId -> NodeId -> Links_ -> Bool
path n1 n2 edges =
    case edges |> List.headBy (\( _, m1, m2 ) -> n1 == m1 || n1 == m2) of
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
