module Run.Screens.Game.Objects.Settlement.Model exposing (..)

import Common.Types exposing (..)


type alias Model =
    Location_
        { player : Player
        , population : Int
        }


type alias Player =
    Int
