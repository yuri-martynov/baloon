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
import Atrapos.Data.L13 as L13
import Atrapos.Data.L14 as L14
import Atrapos.Data.L15 as L15
import Atrapos.Data.L16 as L16
import Atrapos.Data.L17 as L17
import Atrapos.Data.L18 as L18
import Atrapos.Data.L19 as L19
import Atrapos.Data.L20 as L20
import Atrapos.Data.L21 as L21
import Atrapos.Data.L22 as L22
import Atrapos.Data.L23 as L23
import Atrapos.Data.L24 as L24
import Atrapos.Data.L25 as L25
import Atrapos.Data.L26 as L26
import Atrapos.Data.L27 as L27
import Atrapos.Data.L28 as L28
import Atrapos.Data.L29 as L29
import Atrapos.Data.L30 as L30
import Atrapos.Data.L31 as L31
import Atrapos.Data.L32 as L32
import Atrapos.Data.L33 as L33
import Atrapos.Data.L34 as L34
import Atrapos.Data.L35 as L35
import Atrapos.Data.L36 as L36
import Atrapos.Data.L37 as L37
import Atrapos.Data.L38 as L38
import Atrapos.Data.L39 as L39


model : Levels
model =
    [ L30.model
    , L31.model
    , L32.model
    , L33.model
    , L34.model
    , L35.model
    , L36.model
    , L37.model
    , L38.model
    , L39.model
    , L1.model
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
    , L13.model
    , L14.model
    , L15.model
    , L16.model
    , L17.model
    , L18.model
    , L19.model
    , L20.model
    , L21.model
    , L22.model
    , L23.model
    , L24.model
    , L25.model
    , L26.model
    , L27.model
    , L28.model
    , L29.model
    ]
        |> List.indexedMap (,)
        |> Dict.fromList
