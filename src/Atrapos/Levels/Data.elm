module Atrapos.Levels.Data exposing (data)

import Dict exposing (Dict)
import Atrapos.Levels.Model exposing (..)


data : Levels
data =
    [ ( "A", { title = "A"} )
    , ( "B", { title = "B"} )
    -- , ( "C", { title = "C"} )
    -- , ( "D", { title = "D"} )
    -- , ( "E", { title = "E"} )
    -- , ( "F", { title = "F"} )
    -- , ( "G", { title = "G"} )
    -- , ( "H", { title = "H"} )
    -- , ( "I", { title = "I"} )
    -- , ( "J", { title = "J"} )
    -- , ( "K", { title = "K"} )
    -- , ( "L", { title = "L"} )
    -- , ( "M", { title = "M"} )
    -- , ( "N", { title = "N"} )
    ]
        |> Dict.fromList