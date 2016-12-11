module Atrapos.Screens.Game.Solution exposing (solve)

import Dict
import Common.Dict exposing ((#))
import Atrapos.Screens.Game.Model exposing (..)


solve : Model -> Model
solve ({ nodes, links } as model) =
    let
        len a b =
            sqrt ((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2)

        ordered =
            links
                |> Dict.map (\_ { node1, node2 } -> ( ( node1, nodes # node1 ), ( node2, nodes # node2 ) ))
                |> Dict.map (\_ ( ( n1, start ), ( n2, end ) ) -> ( n1, n2, len start end ))
                |> Dict.toList
                |> List.sortBy (\( _, ( _, _, len ) ) -> len)
                |> List.map (\( id, ( n1, n2, _ ) ) -> ( id, n1, n2 ))

        path n1 n2 edges =
            case edges of
                [] -> False
                ((id, m1, m2) as head)::tail -> 
                    if (n1 == m1) then
                        if (n2 == m2) then 
                            True
                        else
                            path m2 n2 tail
                    else 
                        path n1 n2 tail
                        -- ||
                        -- path n2 n1 ((id, m2, m1) :: tail)

        disconnected n1 n2 edges =
            not <| path n1 n2 edges
                
            -- case nodes of
            --     [] ->
            --         True

            --     n :: tail ->
            --         if  then
            --             False
            --         else
            --             disconnected n1 n2 tail

        step edges acc =
            case edges of
                [] ->
                    acc

                (( id, n1, n2 ) as head) :: tail ->
                    if disconnected n1 n2 acc then
                        step tail (head :: acc)
                    else
                        step tail acc

        solution_ =
            step ordered [] |> List.map (\( id, _, _ ) -> id)
    in
        { model
            | links = links |> Dict.map (\id link -> { link | selected = solution_ |> List.member id })
        }
