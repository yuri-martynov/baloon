module Atrapos.Data.Levels exposing (..)

import Dict exposing (Dict)
import Atrapos.Data.Model exposing (Levels)
import Atrapos.Data.L1 as L1
import Atrapos.Data.L2 as L2
import Atrapos.Data.L3 as L3


model : Levels
model =
    [ L1.model
    , L2.model
    , L3.model
    ]
        |> List.indexedMap (,)
        |> Dict.fromList
