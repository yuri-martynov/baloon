module Atrapos.Screens.Game.Solution exposing (solve)

import Dict
import Atrapos.Screens.Game.Model exposing (..)


solve : Model -> Model
solve ({ nodes, links } as model) =
    let
        ordered =
            links
                |> Dict.toList
                |> List.sortBy (\( _, { len } ) -> len)
                |> List.map (\( id, { node1, node2 } ) -> ( id, node1, node2 ))

        path n1 n2 edges =
            let
                edges_ =
                    edges
                        |> List.sortBy
                            (\( _, m1, _ ) ->
                                if n1 == m1 then
                                    0
                                else
                                    1
                            )
            in
                case edges_ of
                    [] ->
                        False

                    ( id, m1, m2 ) :: tail ->
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

        step edges acc =
            case edges of
                [] ->
                    acc

                (( id, n1, n2 ) as head) :: tail ->
                    if path n1 n2 acc then
                        step tail acc
                    else
                        step tail (head :: acc)

        solution_ =
            step ordered [] |> List.map (\( id, _, _ ) -> id)
    in
        { model
            | links = links |> Dict.map (\id link -> { link | selected = solution_ |> List.member id })
        }
