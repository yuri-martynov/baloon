port module Atrapos.Port exposing (..)

import Atrapos.Data.Model as Level


port levelCompleted : Level.Id -> Cmd msg


port getMaxLevel : Int -> Cmd msg


port maxLevel : (Int -> msg) -> Sub msg
