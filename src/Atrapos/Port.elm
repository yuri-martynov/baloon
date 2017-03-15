port module Atrapos.Port exposing (..)

import Atrapos.Data.Model as Level

type alias KeyLevel =
    { key: String
    , level: Int
    }

port setLevel : KeyLevel -> Cmd msg


port getLevel : String -> Cmd msg


port level : (KeyLevel -> msg) -> Sub msg
