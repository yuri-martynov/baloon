module Atrapos.Data.L25 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 5 )
        , ( 1, 8 )
        , ( 1, 11 )
        , ( 4, 1 )
        , ( 4, 4 )
        , ( 4, 12 )
        , ( 4, 15 )
        , ( 6, 1 )
        , ( 6, 15 )
        , ( 8, 1 )
        , ( 8, 4 )
        , ( 8, 12 )
        , ( 8, 15 )
        , ( 11, 5 )
        , ( 11, 8 )
        , ( 11, 11 )
        ]
    , links =
        [ ( 1, [ 2, 4 ] )
        , ( 2, [ 3, 5, 6 ] )
        , ( 3, [ 7 ] )
        , ( 4, [ 8 ] )
        , ( 5, [ 6, 8, 11 ] )
        , ( 6, [ 9, 12 ] )
        , ( 7, [ 9 ] )
        , ( 8, [ 10, 11 ] )
        , ( 9, [ 12, 13 ] )
        , ( 10, [ 14 ] )
        , ( 11, [ 12, 15 ] )
        , ( 12, [ 15 ] )
        , ( 13, [ 16 ] )
        , ( 14, [ 15 ] )
        , ( 15, [ 16 ] )
        ]
    }
