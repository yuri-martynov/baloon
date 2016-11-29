module Ballon.Model exposing (..)

import Common.Types exposing (..)


type alias Model =
    { state : State
    }


type State
    = Na
    | Blowing BlowingModel
    | Flying FlyingModel


type alias BlowingModel =
    Radius' {}


type alias FlyingModel =
    Radius' 
        { y : Float
        }
