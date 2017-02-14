module Atrapos.Data.L26 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 10 )
        , ( 1, 13 )
        , ( 3, 5 )
        , ( 3, 9 )
        , ( 3, 15 )
        , ( 6, 1 )
        , ( 6, 4 )
        , ( 6, 9 )
        , ( 6, 13 )
        , ( 9, 5 )
        , ( 9, 9 )
        , ( 9, 15 )
        , ( 12, 10 )
        , ( 11, 13 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4 ] )
        , ( 2, [ 4, 5, 8, 9 ] )
        , ( 3, [ 4, 6, 7 ] )
        , ( 4, [ 7, 8, 9 ] )
        , ( 5, [ 9, 12 ] )
        , ( 6, [ 7, 10 ] )
        , ( 7, [ 10, 11 ] )
        , ( 8, [ 11, 14 ] )
        , ( 9, [ 11, 12, 14 ] )
        , ( 10, [ 11, 13 ] )
        , ( 11, [ 13, 14 ] )
        , ( 12, [ 14 ] )
        , ( 13, [ 14 ] )
        ]
    }
