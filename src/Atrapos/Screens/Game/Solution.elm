module Atrapos.Screens.Game.Solution exposing (solve)

import Dict
import Common.Dict exposing ((#))
import Common.Math exposing (len)
import Atrapos.Screens.Game.Model exposing (..)


solve : Model -> Model
solve ({ nodes, links } as model) =
    let
        ordered =
            links
                |> Dict.map (\_ { node1, node2 } -> ( node1, node2, len  (nodes # node1) (nodes # node2 ) ))
                |> Dict.toList
                |> List.sortBy (\( _, ( _, _, len ) ) -> len)
                |> List.map (\( id, ( n1, n2, _ ) ) -> ( id, n1, n2 ))

        path n1 n2 edges  =
            case edges |> List.sortBy (\(_,m1,_) -> if n1 == m1 then 0 else 1) of
                [] -> False
                ((id, m1, m2) as head)::tail -> 
                    let path_ n1 n2 m1 m2  =
                        if (n1 == m1) then
                            if (n2 == m2) then 
                                True
                            else
                                path m2 n2 tail 
                        else
                            -- if acc |> List.member id then
                                path n1 n2 tail 
                            -- else
                                -- path n1 n2 (tail ++ [head]) (id::acc)
                            
                    in
                        path_ n1 n2 m1 m2 
                        ||
                        path_ n1 n2 m2 m1 
                        ||
                        path_ n2 n1 m1 m2 
                        -- ||
                        -- path_ n2 n1 m2 m1 

        disconnected n1 n2 edges =
            not <| path n1 n2 edges               

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
