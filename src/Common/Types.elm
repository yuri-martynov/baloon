module Common.Types exposing (..)


type alias Radius_ a =
    { a | radius : Float }


type alias Size_ a =
    { a
        | w : Float
        , h : Float
    }


type alias Size =
    Size_ {}


type alias Scale_ a =
    { a | scale : Float }


type alias Angle_ a =
    { a | angle : Float }


type alias Len_ a =
    { a | len : Float }


type alias Vector_ a =
    Angle_ (Len_ a)


type alias Acceleration_ a =
    { a
        | acceleration : Float
    }


type alias Location_ a =
    { a
        | x : Float
        , y : Float
    }


type alias Location =
    Location_ {}


type alias Circle_ a =
    Location_ (Radius_ a)


type alias Padding_ a =
    LeftTop_
        { a
            | right : Float
            , bottom : Float
        }


type alias LeftTop_ a =
    { a
        | left : Float
        , top : Float
    }


type alias LeftTop =
    LeftTop_ {}


type alias Padding =
    Padding_ {}


turn : Size -> Size
turn { h, w } =
    { w = h, h = w }
