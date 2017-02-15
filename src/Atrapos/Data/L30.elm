module Atrapos.Data.L30 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 2 )
        , ( 3, 10 )
        , ( 4, 4 )
        , ( 8, 1 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4] )
        , ( 2, [ 3, 4 ] )
        , ( 3, [ 4 ] )
        ]
    }
