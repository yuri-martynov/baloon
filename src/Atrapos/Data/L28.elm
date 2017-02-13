module Atrapos.Data.L28 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 15 )
        , ( 4, 5 )
        , ( 3, 9 )
        , ( 7, 4 )
        , ( 7, 8 )
        , ( 7, 14 )
        , ( 7, 22 )
        , ( 13, 1 )
        , ( 13, 5 )
        , ( 15, 14 )
        , ( 18, 22 )
        , ( 22, 5)
        , ( 24, 15 )
        ]
    , links =
        [ ( 1, [ 3, 5, 6, 7 ] )
        , ( 2, [ 3, 4 ] )
        , ( 3, [ 4, 5 ] )
        , ( 4, [ 5, 8 ] )
        , ( 5, [ 6, 8, 9 ] )
        , ( 6, [ 7, 9, 10 ] )
        , ( 7, [ 10, 11 ] )
        , ( 8, [ 9, 12 ] )
        , ( 9, [ 10, 12 ] )
        , ( 10, [ 11, 12, 13 ])
        , ( 11, [ 13 ])
        , ( 12, [ 13 ])
        ]
    }
