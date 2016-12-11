module Atrapos.Screens.Game.Init exposing (init)

import Window 
import Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (Msg)
import Atrapos.Screens.Game.Solution exposing (solve)

init: Window.Size -> (Model, Cmd Msg) 
init s =
    solve { windowSize = s
    , viewBoxWidth = 40.0
    , nodes =  
        [ (2,19)
        , (7,10)
        , (7,17)
        , (9,13)
        , (16,29)
        , (22,4)
        , (23,18)
        , (29,2)
        , (30,4)
        , (35,6)
        ] 
            |> List.indexedMap (\i (x,y) -> (i + 1, {x= x, y=y} ))
            |> Dict.fromList
    , links = 
        [ (1, [2,3,5])
        , (2, [3,4,6])
        , (3, [4,5,7])
        , (4, [6,7])
        , (5, [7,10])
        , (6, [7,8,9])
        , (7, [9,10])
        , (8, [9,10])
        , (9, [10])
        ] 
            |> List.map (\(n1, nodes) -> nodes |> List.map (\n2-> {node1 = n1, node2 = n2, selected = False}) )
            |> List.concat
            |> List.indexedMap (,)
            |> Dict.fromList
    } 
    ! []
