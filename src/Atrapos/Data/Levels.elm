module Atrapos.Data.Levels exposing (..)

import Dict exposing (Dict)
import Atrapos.Data.Model exposing (Levels)
import Atrapos.Data.L1 as L1
import Atrapos.Data.L2 as L2
import Atrapos.Data.L3 as L3
import Atrapos.Data.L4 as L4
import Atrapos.Data.L5 as L5
import Atrapos.Data.L6 as L6
import Atrapos.Data.L7 as L7
import Atrapos.Data.L8 as L8
import Atrapos.Data.L9 as L9
import Atrapos.Data.L10 as L10
import Atrapos.Data.L11 as L11
import Atrapos.Data.L12 as L12

model : Levels
model =
    [ L1.model
    , L2.model
    , L3.model
    , L4.model
    , L5.model
    , L6.model
    , L7.model
    , L8.model
    , L9.model
    , L10.model
    , L11.model
    , L12.model
    ]
        |> List.indexedMap (,)
        |> Dict.fromList
