module Atrapos.Data.L7 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 13 )
        , ( 2, 9 )
        , ( 2, 20 )
        , ( 5, 2 )
        , ( 5, 7 )
        , ( 5, 11 )
        , ( 5, 16 )
        , ( 8, 9 )
        , ( 8, 20 )
        , ( 10, 13 )
        ]
    , links =
        [ ( 1, [ 3, 6, 7, 10 ] )
        , ( 2, [ 4, 5, 6, 8 ] )
        , ( 3, [ 6, 9 ] )
        , ( 4, [ 2, 5, 8 ] )
        , ( 5, [ 6, 8 ] )
        , ( 6, [ 8, 9, 10 ] )
        , ( 7, [ 10 ] )
        , ( 9, [ 10 ] )
        ]
    }
