module Atrapos.Game.Data.A exposing (model)

import Atrapos.Game.Data.Model exposing (..)

model: Model
model =
    { nodes = 
        [ ( 1, 7 )
        , ( 1, 13 )
        , ( 5, 3 )
        , ( 5, 10 )
        , ( 5, 17 )
        , ( 9, 7 )
        , ( 9, 13 )
        ]
    , links = 
        [ (1, [2, 3, 4, 6])
        , (2, [4, 5, 7])
        , (3, [4, 6])
        , (4, [5, 6, 7])
        , (5, [7])
        , (6, [7])
        ]
    }
