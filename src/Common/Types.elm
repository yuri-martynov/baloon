module Common.Types exposing (..)


type alias Radius' a =
    { a | radius : Float }


type alias Size =
    { h : Float
    , w : Float
    }


type alias Angle' a =
    { a | angle : Float }


type alias Vector' a =
    Angle'
        { a
            | len : Float
        }


type alias Acceleration' a =
    { a
        | acceleration : Float
    }


type alias Location' a =
    { a
        | x : Float
        , y : Float
    }


type alias Location =
    Location' {}


type alias Circle' a =
    Location' (Radius' a)
