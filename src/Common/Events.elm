module Common.Events exposing (onRightEdgeSwipeStart, onRightEdgeSwipeEnd)

import Html exposing (Attribute)
import Html.Events exposing (on)
import Json.Decode exposing (Decoder, map2, field, float, at)
import Common.Decode exposing (customDecoder)
import Common.Types exposing (Location)


onRightEdgeSwipeStart: (Location -> msg) -> Attribute msg
onRightEdgeSwipeStart msg = 
    on "touchstart" (customDecoder (decodeTouch "touches") (leftEdgeSwipeStart msg))


onRightEdgeSwipeEnd: Location -> msg -> Attribute msg
onRightEdgeSwipeEnd start msg = 
    on "touchend" (customDecoder (decodeTouch "changedTouches") (leftEdgeSwipeEnd start msg))

-- PRIVATE -----------

decodeTouch: String -> Decoder Location
decodeTouch eventKey =
    at [eventKey, "0"] decodeClientXY

decodeClientXY: Decoder Location
decodeClientXY =
    map2 (\x y -> {x=x,y=y})
        (field "clientX" float)
        (field "clientY" float)


leftEdgeSwipeStart : (Location -> msg) -> Location -> Result String msg
leftEdgeSwipeStart msg ({x} as location )=
    if x < 16 then 
        Ok (msg location)
    else
        Err "not a left edge swipe start"

leftEdgeSwipeEnd : Location -> msg -> Location -> Result String msg
leftEdgeSwipeEnd start msg end =
    let k = start.y / end.y in
    if start.x < end.x && k > 0.8 && k < 1.2 then 
        Ok msg
    else
        Err "not a left edge swipe end"