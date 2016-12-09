module Run.Screens.Game.View exposing (view)

import Svg exposing (Svg, svg, circle)
import Svg.Attributes exposing (version)
import Common.ViewBox as ViewBox
import Run.Screens.Game.Model exposing (Model)


view : Model -> Svg msg
view model =
    svg_ model [view_ model]

view_ : Model -> Svg msg
view_ model =
    circle [] []


svg_ {windowSize, viewBoxWidth} =
    let
        size =
            ViewBox.size viewBoxWidth windowSize
    in
        svg [ version "1.1", ViewBox.init size ]
