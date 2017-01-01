module Atrapos.Game.Init exposing (init, init_)

import Window 
import Dict
import Task
import Common.Maybe as Maybe
import Atrapos.Levels.Model exposing (LevelId)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (Msg(Init))
import Atrapos.Game.Solution as Solution
import Atrapos.Game.Selection.Path as Selection
import Atrapos.Game.Link.Init as Link
import Atrapos.Game.Orientation as Orientation
import Atrapos.Game.Cmd as Cmd

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

        offset = 1

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
          , padding = {left = 16, top = 16, right = 16, bottom = 16 }
          , viewBoxSize = viewBoxSize
          , nodes = nodes_
          , links = links_
          , minLen = minLen
          , victory = False
          , selection = None
          , nodesTurned = Nothing
          , menu = False
          , swipe = Nothing
          } 
            |> Orientation.update
            |> Loaded
          , Cmd.none 
        )
