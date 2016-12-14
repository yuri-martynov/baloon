module Atrapos.Screens.Game.Init exposing (init)

import Window
import Dict
import Common.Maybe as Maybe
import Atrapos.Screens.Levels.Model exposing (Level)
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (Msg)
import Atrapos.Screens.Game.Solution as Solution
import Atrapos.Screens.Game.Selection.Path as Selection
import Atrapos.Screens.Game.Link.Init as Link


init : Window.Size -> Level -> ( Model, Cmd Msg )
init s { nodes, links } =
    let
        nodes_ =
            nodes
                |> List.indexedMap (\i ( x, y ) -> ( i + 1, { x = toFloat x, y = toFloat y } ))
                |> Dict.fromList

        links_ =
            links
                |> List.map (\( n1, nodes ) -> nodes |> List.map (\n2 -> nodes_ |> Link.init n1 n2))
                |> List.concat
                |> List.indexedMap (,)
                |> Dict.fromList

        solution =
            Solution.solution nodes_ links_

        minLen =
            solution |> Selection.len links_


        viewBoxWidth =
            nodes 
                |> List.map (\(x,y) -> [x,y])
                |> List.concat 
                |> List.maximum 
                |> Maybe.return 
                |> (+) 2
                |> toFloat
    in
        { windowSize = s
        , viewBoxWidth = viewBoxWidth
        , nodes = nodes_
        , links = links_
        , minLen = minLen
        , victory = False
        , selection = Nothing
        }
            ! []
