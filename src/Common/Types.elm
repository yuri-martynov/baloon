module Common.Types exposing (..)


type alias Radius_ a =
    { a | radius : Float }


type alias Size =
    { h : Float
    , w : Float
    }


type alias Angle_ a =
    { a | angle : Float }


type alias Vector_ a =
    Angle_
        { a
            | len : Float
        }


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
