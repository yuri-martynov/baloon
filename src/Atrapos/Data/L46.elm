module Atrapos.Data.L46 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 4 )
        , ( 3, 1 )
        , ( 4, 5 )
        , ( 4, 10)
        , ( 7, 4 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4 ] )
        , ( 2, [ 3, 5 ] )
        , ( 3, [ 4, 5 ])
        , ( 4, [ 5 ])
        ]
    }
