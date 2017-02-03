module Atrapos.Game.Selection.View exposing (view)

import Svg exposing (Svg, g, line)
import Svg.Attributes exposing (..)
import Common.Dict exposing ((#))
import Common.Types exposing (Location)
import  Atrapos.Game.Model exposing (..)

view : Nodes -> Selection -> Svg msg
view nodes model =
    case model of
        None -> g [] []
        Selection model -> model |> selection nodes
        Deselection model -> model |> deselection

selection: Nodes -> SelectionModel -> Svg msg
selection nodes { lastNode, endLocation } =
    draw "select" (nodes # lastNode) endLocation


deselection: DeselectionModel -> Svg msg
deselection { startLocation, endLocation } =
    draw "deselect" startLocation endLocation


draw: String -> Location -> Location -> Svg msg
draw class_ a b =
    line 
        [ class class_
        , a.x |> toString |> x1
        , a.y |> toString |> y1
        , b.x |> toString |> x2
        , b.y |> toString |> y2
        ]
        []

