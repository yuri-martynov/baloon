module Atrapos.Screens.Game.Init exposing (init)

import Window
import Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (Msg)
import Atrapos.Screens.Game.Solution as Solution
import Atrapos.Screens.Game.Objects.Link.Init as Link


init : Window.Size -> ( Model, Cmd Msg )
init s =
    let
        nodes_ =
            [ ( 2, 19 )
            , ( 7, 10 )
            , ( 7, 17 )
            , ( 9, 13 )
            , ( 16, 29 )
            , ( 22, 4 )
            , ( 23, 18 )
            , ( 29, 2 )
            , ( 30, 4 )
            , ( 35, 6 )
            ]
                |> List.indexedMap (\i ( x, y ) -> ( i + 1, { x = x, y = y } ))
                |> Dict.fromList

        links_ =
            [ ( 1, [ 2, 3, 5 ] )
            , ( 2, [ 3, 4, 6 ] )
            , ( 3, [ 4, 5, 7 ] )
            , ( 4, [ 6, 7 ] )
            , ( 5, [ 7, 10 ] )
            , ( 6, [ 7, 8, 9 ] )
            , ( 7, [ 9, 10 ] )
            , ( 8, [ 9, 10 ] )
            , ( 9, [ 10 ] )
            ]
                |> List.map (\( n1, nodes ) -> nodes |> List.map (\n2 -> nodes_ |> Link.init n1 n2))
                |> List.concat
                |> List.indexedMap (,)
                |> Dict.fromList
    in
        Solution.apply
            { windowSize = s
            , viewBoxWidth = 40.0
            , nodes = nodes_
            , links = links_
            , solution = Solution.solution nodes_ links_
            }
            ! []
