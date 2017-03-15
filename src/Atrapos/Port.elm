port module Atrapos.Port exposing (..)

type alias KeyLevel =
    { key: String
    , level: Int
    }

port setMaxLevel : KeyLevel -> Cmd msg

port setLevel : KeyLevel -> Cmd msg


port getLevel : String -> Cmd msg


port level : (KeyLevel -> msg) -> Sub msg
