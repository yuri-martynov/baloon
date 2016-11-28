module Ballon.Model exposing (..)


type alias Model =
    { state : State
    }


type State
    = Na
    | Blowing BlowingModel
    | Flying FlyingModel


type alias BlowingModel =
    { radius : Float
    }

type alias FlyingModel =
    { radius : Float
    , y: Float
    }