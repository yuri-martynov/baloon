module Atrapos.Data.L17 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 8 )
        , ( 3, 3 )
        , ( 3, 8 )
        , ( 3, 14 )
        , ( 4, 10 )
        , ( 6, 1 )
        , ( 6, 6 )
        , ( 6, 15 )
        , ( 8, 10 )
        , ( 9, 3 )
        , ( 9, 8 )
        , ( 9, 14 )
        , ( 11, 8 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4 ] )
        , ( 2, [ 3, 6 ] )
        , ( 3, [ 4, 5, 6 ] )
        , ( 4, [ 8 ] )
        , ( 5, [ 7, 8 ] )
        , ( 6, [ 7, 10, 11 ] )
        , ( 7, [ 8, 9 ] )
        , ( 8, [ 9, 12 ] )
        , ( 9, [ 11 ] )
        , ( 10, [ 11, 13 ] )
        , ( 11, [ 12, 13 ] )
        , ( 12, [ 13 ] )
        ]
    }
