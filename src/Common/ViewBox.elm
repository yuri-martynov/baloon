module Common.ViewBox exposing (Model_, Model, init, location)

import Svg.Attributes exposing (viewBox, style)
import Svg exposing (Attribute)
import Mouse
import Common.Types exposing (Size, Location, Padding)
import Common.WindowSize as WindowSize 


type alias Model_ a =
    WindowSize.Model 
        { a
            | viewBoxSize : Size
            , padding: Padding
        }


type alias Model =
    Model_ {}


init: Model_ a -> Attribute msg
init model =
    model |> size |> init_ 


init_ : Size -> Attribute msg
init_ { w, h } =
    [ 0.0, 0.0, w, h ] |> List.foldl fold_ "" |> viewBox


location : Model_ a -> Mouse.Position -> Location
location model mousePosition =
    location_ model (size model) mousePosition




-- PRIVATES ---------


size : Model_ a -> Size
size { padding, viewBoxSize, windowSize } =
    let
        aspectRation =
            (toFloat windowSize.height - padding.top - padding.bottom) / (toFloat windowSize.width - padding.left - padding.right)

        viewBoxHeight =
            viewBoxSize.w * aspectRation

        downScale ({w, h} as size) =
            if h < viewBoxSize.h then
                { w = viewBoxSize.h / aspectRation, h = viewBoxSize.h}
            else
                size
 
    in
        { w = viewBoxSize.w, h = viewBoxHeight } 
            |> downScale


location_ : Model_ a -> Size -> Mouse.Position -> Location
location_ {padding, windowSize} { w, h }  { x, y } =
    { x = (toFloat x - padding.left) * (w / (toFloat windowSize.width - padding.left - padding.right))
    , y = (toFloat y - padding.top) * (h / (toFloat windowSize.height - padding.top - padding.bottom))
    }


fold_ a b =
    b ++ (toString a) ++ " "
