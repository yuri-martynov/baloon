module Atrapos.Game.Init exposing (init, init_)

import Window
import Dict
import Task
import Common.Maybe as Maybe
import Atrapos.Data.Model as Data
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (Msg(Init))
import Atrapos.Game.Solution as Solution
import Atrapos.Game.Selection.Path as Selection
import Atrapos.Game.Link.Init as Link


init : Data.Id -> ( Model, Cmd Msg )
init id =
    ( Loading id
    , Window.size
        |> Task.perform Init
    )


init_ : Data.Id -> Window.Size -> Data.Model -> ( Model, Cmd Msg )
init_ id s { nodes, links } =
    let
        minX =
            nodes |> List.map Tuple.first |> List.minimum |> Maybe.return

        minY =
            nodes |> List.map Tuple.second |> List.minimum |> Maybe.return

        nodes_ =
            nodes
                |> List.indexedMap
                    (\i ( x, y ) ->
                        ( i + 1
                        , { x = x - minX 
                          , y = y - minY 
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
            nodes_ |> Dict.toList |> List.map (Tuple.second >> .y) |> List.maximum |> Maybe.return

        viewBoxSize =
            { w = maxX , h = maxY }
    in
        ( { windowSize = s
          , padding = { left = 50, top = 100, right = 50, bottom = 50 }
          , viewBoxSize = viewBoxSize
          , nodes = nodes_
          , links = links_
          , minLen = minLen
          , victory = False
          , selection = None
          , menu = False
          , levelId = id
          , solution = solution
          , counter = [0,0]
          }
            |> Loaded
        , Cmd.none
        )
