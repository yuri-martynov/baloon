module Run.Screens.Game.View exposing (view)

import Dict
import Svg exposing (Svg, svg, circle, g)
import Svg.Attributes exposing (..)
import Common.ViewBox as ViewBox
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Objects.Settlement as Settlement


view : Model -> Svg msg
view model =
    svg_ model [ view_ model ]


view_ : Model -> Svg msg
view_ { settlements } =
    settlements
        |> Dict.values
        |> List.map Settlement.view
        |> g []


svg_ { windowSize, viewBoxWidth } =
    let
        size =
            ViewBox.size viewBoxWidth windowSize
    in
        svg [ version "1.1", ViewBox.init size ]
