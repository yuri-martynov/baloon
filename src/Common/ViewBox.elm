module Common.ViewBox exposing (Model_, Model, init, location)

import Svg.Attributes exposing (viewBox, style)
import Svg exposing (Attribute)
import Mouse
import Common.Types exposing (Size, Location, Padding, LeftTop)
import Common.WindowSize as WindowSize


type alias Model_ a =
    WindowSize.Model
        { a
            | viewBoxSize : Size
            , padding : Padding
        }


type alias Model =
    Model_ {}


init : Model_ a -> Attribute msg
init model =
    model |> center |> init_


init_ : (LeftTop, Size) -> Attribute msg
init_ ({left, top}, { w, h }) =
    [ -left, -top, w, h ] |> List.foldl fold_ "" |> viewBox


location : Model_ a -> Mouse.Position -> Location
location model mousePosition =
    location_ model (center model) mousePosition



-- PRIVATES ---------


center : Model_ a -> (LeftTop, Size)
center { padding, viewBoxSize, windowSize } =
    let
        aspectRation =
            (toFloat windowSize.height - padding.top - padding.bottom) / (toFloat windowSize.width - padding.left - padding.right)

        h =
            viewBoxSize.w * aspectRation

        leftTop =
            { left = 0.0
            , top = (h - viewBoxSize.h) / 2
            }
    in
        (leftTop, viewBoxSize)


location_ : Model_ a -> (LeftTop, Size) -> Mouse.Position -> Location
location_ { padding, windowSize } ({left, top}, { w, h }) { x, y } =
    let
        scaleX =
            (w + 2 * left) / (toFloat windowSize.width - padding.left - padding.right)

        scaleY = 
            (h + 2 * top) / (toFloat windowSize.height - padding.top - padding.bottom)

    in
        { x = (toFloat x - padding.left ) * scaleX - left
        , y = (toFloat y - padding.top  ) * scaleY - top
        }


fold_ a b =
    b ++ (toString a) ++ " "
