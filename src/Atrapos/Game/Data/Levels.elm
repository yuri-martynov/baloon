module Atrapos.Game.Data.Levels exposing (..)

import Dict exposing (Dict)
import Atrapos.Levels.Model exposing (LevelId)
import Atrapos.Game.Data.Model exposing (Model)

import Atrapos.Game.Data.A as A
import Atrapos.Game.Data.B as B

model: Dict LevelId Model
model =
    [ ( "A", A.model ) 
    , ( "B", B.model ) 
    ]
        |> Dict.fromList