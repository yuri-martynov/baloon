module Atrapos.Screens.Game.Init exposing (init, init_)

import Window 
import Dict
import Task
import Common.Maybe as Maybe
import Atrapos.Screens.Levels.Model exposing (LevelId)
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (Msg(Init))
import Atrapos.Screens.Game.Solution as Solution
import Atrapos.Screens.Game.Selection.Path as Selection
import Atrapos.Screens.Game.Link.Init as Link
import Atrapos.Screens.Game.Orientation as Orientation
import Atrapos.Screens.Game.Cmd as Cmd

init : LevelId -> (Model, Cmd Msg)
init id = 
    ( Loading
    , Window.size
        |> Task.andThen (\size -> id |> Cmd.load |> Task.map (\level -> (size, level)))
        |> Task.attempt Init
    )

init_ : Window.Size -> Cmd.Level -> ( Model, Cmd Msg )
init_ s { nodes, links } =
    let
        minX =
            nodes |> List.map Tuple.first |> List.minimum |> Maybe.return 

        minY =
            nodes |> List.map Tuple.second |> List.minimum |> Maybe.return 

        offset = 2

        nodes_ =
            nodes
                |> List.indexedMap 
                    (\i ( x, y ) -> 
                        ( i + 1, 
                          { x = toFloat <| x - minX + offset
                          , y = toFloat <| y - minY + offset
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

        maxX =
            nodes_ |> Dict.toList |> List.map (Tuple.second >> .x) |> List.maximum |> Maybe.return 

        maxY =
            nodes_ |> Dict.toList |>  List.map (Tuple.second >> .y) |> List.maximum |> Maybe.return 
        

        viewBoxSize = { w = maxX + offset, h = maxY + offset }
    in
        ( { windowSize = s
          , viewBoxSize = viewBoxSize
          , nodes = nodes_
          , links = links_
          , minLen = minLen
          , victory = False
          , selection = None
          , nodesTurned = Nothing
          } 
            |> Orientation.update
            |> Loaded
          , Cmd.none 
        )
