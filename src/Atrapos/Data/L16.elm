module Atrapos.Data.L16 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 2, 3 )
        , ( 2, 11 )
        , ( 4, 0 )
        , ( 4, 7 )
        , ( 6, 3 )
        , ( 6, 11 )
        , ( 8, 0 )
        , ( 8, 7 )
        , ( 10, 3 )
        , ( 10, 11 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4, 5 ] )
        , ( 2, [ 4, 6 ] )
        , ( 3, [ 7 ] )
        , ( 4, [ 8 ] )
        , ( 5, [ 7, 8, 9 ] )
        , ( 6, [ 8, 10 ] )
        , ( 7, [ 9 ] )
        , ( 8, [ 9, 10 ] )
        , ( 9, [ 10 ] )
        ]
    }
