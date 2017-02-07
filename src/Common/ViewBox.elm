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


init_ : ( LeftTop, Size ) -> Attribute msg
init_ ( { left, top }, { w, h } ) =
    [ -left, -top, w, h ] |> List.foldl fold_ "" |> viewBox


location : Model_ a -> Mouse.Position -> Location
location model mousePosition =
    location_ model (center model) mousePosition



-- PRIVATES ---------


center : Model_ a -> ( LeftTop, Size )
center { padding, viewBoxSize, windowSize } =
    let
        height =
            toFloat windowSize.height - padding.top - padding.bottom

        width = 
            toFloat windowSize.width - padding.left - padding.right

        scaleX =
             viewBoxSize.w / width

        scaleY =
             viewBoxSize.h / height

        left =
            padding.left * scaleX

        top = 
            padding.top * scaleY

        a = height / width

        w = viewBoxSize.w + (padding.left + padding.right) * scaleX
    in
        ( {left = left, top = top}
        , {w = w, h = w * a}
        )



location_ : Model_ a -> ( LeftTop, Size ) -> Mouse.Position -> Location
location_ { padding, windowSize } ( { left, top }, { w, h } ) { x, y } =
    let
        height =
            toFloat windowSize.height 

        width = 
            toFloat windowSize.width 

        scaleX =
             w / width

        scaleY =
            h  / height
    in
        { x = (toFloat x - padding.left ) * scaleX 
        , y = (toFloat y - padding.top ) * scaleY
        }


fold_ a b =
    b ++ (toString a) ++ " "
