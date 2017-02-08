module Atrapos.Data.L3 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 15 )
        , ( 1, 4 )
        , ( 1, 10 )
        , ( 5, 1 )
        , ( 5, 19 )
        , ( 9, 4 )
        , ( 9, 10 )
        , ( 10, 15 )
        ]
    , links =
        [ ( 1, [ 3, 5, 8 ] )
        , ( 2, [ 4, 7 ] )
        , ( 3, [ 4, 5, 6, 7 ] )
        , ( 4, [ 5, 6, 7 ] )
        , ( 5, [ 7, 8 ] )
        , ( 7, [ 8 ] )
        ]
    }
