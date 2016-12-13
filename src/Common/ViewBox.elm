module Common.ViewBox exposing (Model_, Model, init, location)

import Svg.Attributes exposing (viewBox)
import Svg exposing (Attribute)
import Window
import Mouse
import Common.Types exposing (Size, Location)
import Common.WindowSize as WindowSize 


type alias Model_ a =
    WindowSize.Model 
        { a
            | viewBoxWidth : Float
        }


type alias Model =
    Model_ {}

init: Model_ a -> Attribute msg
init model =
    model |> size |> init_


init_ : Size -> Attribute msg
init_ { w, h } =
    [ 0.0, 0.0, w, h ]
        |> List.foldl fold_ ""
        |> viewBox


location : Model_ a -> Mouse.Position -> Location
location ({ viewBoxWidth, windowSize } as model) mousePosition =
    location_ (size model) windowSize mousePosition



-- PRIVATES ---------


size : Model_ a -> Size
size { viewBoxWidth, windowSize } =
    let
        aspectRation =
            (toFloat windowSize.height) / (toFloat windowSize.width)

        viewBoxHeight =
            viewBoxWidth * aspectRation
    in
        { w = viewBoxWidth, h = viewBoxHeight }


location_ : Size -> Window.Size -> Mouse.Position -> Location
location_ { w, h } { width, height } { x, y } =
    { x = (toFloat x) * (w / (toFloat width))
    , y = (toFloat y) * (h / (toFloat height))
    }


fold_ a b =
    b ++ (toString a) ++ " "
