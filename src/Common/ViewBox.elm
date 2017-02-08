module Common.ViewBox exposing (Model_, Model, init, location)

import Svg.Attributes exposing (viewBox, style)
import Svg exposing (Attribute)
import Mouse
import Common.Types exposing (Size_, Size, Scale_, Location, Padding, LeftTop_)
import Common.WindowSize as WindowSize


type alias Model_ a =
    WindowSize.Model
        { a
            | viewBoxSize : Size
            , padding : Padding
        }


type alias Model =
    Model_ {}


type alias ViewBox =
    LeftTop_ (Size_ (Scale_ {}))


init : Model_ a -> Attribute msg
init model =
    model |> center |> init_


init_ : ViewBox -> Attribute msg
init_ { left, top, w, h } =
    [ -left, -top, w, h ] |> List.foldl fold_ "" |> viewBox


location : Model_ a -> Mouse.Position -> Location
location model mousePosition =
    location_ model (center model) mousePosition



-- PRIVATES ---------


center : Model_ a -> ViewBox
center { padding, viewBoxSize, windowSize } =
    let
        height =
            toFloat windowSize.height - padding.top - padding.bottom

        width =
            toFloat windowSize.width - padding.left - padding.right

        ( scaleX, scaleY ) =
            ( viewBoxSize.w / width
            , viewBoxSize.h / height
            )

        scale =
            max scaleX scaleY

        left =
            padding.left * scale

        right =
            padding.right * scale

        top =
            padding.top * scale

        bottom =
            padding.bottom * scale

        w =
            width * scale + right + left

        h =
            viewBoxSize.h + top + bottom

        fullH =
            toFloat windowSize.height * scale

        paddingTop =
            (fullH - h) / 2
    in
        { left = left
        , top = top + paddingTop
        , w = w
        , h = fullH
        , scale = scale
        }


location_ : Model_ a -> ViewBox -> Mouse.Position -> Location
location_ { windowSize } { left, top, scale } { x, y } =
    { x = toFloat x * scale - left
    , y = toFloat y * scale - top
    }


fold_ a b =
    b ++ (toString a) ++ " "
