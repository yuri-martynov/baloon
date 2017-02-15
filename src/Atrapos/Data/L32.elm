module Atrapos.Data.L32 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 1 )
        , ( 1, 10 )
        , ( 4, 1 )
        , ( 4, 8 )
        , ( 8, 1 )
        , ( 7, 10 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4 ] )
        , ( 2, [ 4, 6 ] )
        , ( 3, [ 4, 5 ] )
        , ( 4, [ 5, 6 ] )
        , ( 5, [ 6 ] )
        ]
    }
