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
import Atrapos.Screens.Game.Orientation as Orientation



init : Window.Size -> Level -> ( Model, Cmd Msg )
init s { nodes, links } =
    let
        minX =
            nodes |> List.map Tuple.first |> List.minimum |> Maybe.return 

        minY =
            nodes |> List.map Tuple.second |> List.minimum |> Maybe.return 

        nodes_ =
            nodes
                |> List.indexedMap 
                    (\i ( x, y ) -> 
                        ( i + 1, 
                          { x = toFloat <| x - minX + 2
                          , y = toFloat <| y - minY + 2
                          } 
                        )
                    )
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
            nodes_
                |> Dict.values 
                |> List.map (\{x,y} -> [x,y])
                |> List.concat 
                |> List.maximum 
                |> Maybe.return 
                |> (+) 2
    in
        ( { windowSize = s
          , viewBoxWidth = viewBoxWidth
          , nodes = nodes_
          , links = links_
          , minLen = minLen
          , victory = False
          , selection = Nothing
          , nodesTurned = Nothing
          } 
            |> Orientation.update
          , Cmd.none 
        )
