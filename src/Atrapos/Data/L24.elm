module Atrapos.Data.L24 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 6 )
        , ( 1, 12 )
        , ( 4, 1 )
        , ( 4, 17 )
        , ( 7, 5 )
        , ( 7, 13 )
        , ( 10, 1 )
        , ( 10, 17 )
        , ( 13, 6 )
        , ( 13, 13 )
        ]
    , links =
        [ ( 1, [ 2, 3, 5, 6 ] )
        , ( 2, [ 4, 5, 6 ] )
        , ( 3, [ 5, 7 ] )
        , ( 4, [ 6, 8 ] )
        , ( 5, [ 7, 9, 10 ] )
        , ( 6, [ 8, 9, 10 ] )
        , ( 7, [ 9 ] )
        , ( 8, [ 10 ] )
        , ( 9, [ 10 ] )
        ]
    }
