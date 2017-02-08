module Atrapos.Data.L13 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 1 )
        , ( 1, 11 )
        , ( 1, 17 )
        , ( 4, 13 )
        , ( 5, 1 )
        , ( 7, 11 )
        , ( 7, 17 )
        , ( 11, 1 )
        , ( 11, 11 )
        , ( 11, 17 )
        ]
    , links =
        [ ( 1, [ 2, 5 ] )
        , ( 2, [ 3, 4, 5, 6 ] )
        , ( 3, [ 4, 7 ] )
        , ( 4, [ 7 ] )
        , ( 5, [ 6, 8 ] )
        , ( 6, [ 7, 8, 9 ] )
        , ( 7, [ 9, 10 ] )
        , ( 8, [ 9 ] )
        , ( 9, [ 10 ] )
        ]
    }
