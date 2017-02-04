module Atrapos.Data.Levels exposing (..)

import Dict exposing (Dict)
import Atrapos.Data.Model exposing (Levels)
import Atrapos.Data.A as A
import Atrapos.Data.B as B


model : Levels
model =
    [ A.model
    , B.model
    ]
        |> List.indexedMap (,)
        |> Dict.fromList
