module Common.ViewBox exposing (init, location, size)

import Svg.Attributes exposing (viewBox)
import Svg exposing (Attribute)
import Window
import Mouse
import Common.Types exposing (Size, Location)


init : Size -> Attribute msg
init { w, h } =
    [ 0.0, 0.0, w, h ]
        |> List.foldl fold_ ""
        |> viewBox


location : Size -> Window.Size -> Mouse.Position -> Location
location { w, h } { width, height } { x, y } =
    { x = (toFloat x) * (w / (toFloat width))
    , y = (toFloat y) * (h / (toFloat height))
    }


size : Float -> Window.Size -> Size
size viewBoxWidth windowSize =
    let
        aspectRation =
            (toFloat windowSize.height) / (toFloat windowSize.width)

        viewBoxHeight =
            viewBoxWidth * aspectRation
    in
        { w = viewBoxWidth, h = viewBoxHeight }


fold_ a b =
    b ++ (toString a) ++ " "
