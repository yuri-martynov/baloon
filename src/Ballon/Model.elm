module Ballon.Model exposing (..)

import Window
import Common.Types exposing (..)


type alias Model =
    { windowSize : Maybe Window.Size
    , state : State
    }


type State
    = Na
    | Blowing BlowingModel
    | Flying FlyingModel


type alias BlowingModel =
    Location_ (Radius_ { boomRadius : Maybe Float })


type alias FlyingModel =
    Location_ (Radius_ {})
