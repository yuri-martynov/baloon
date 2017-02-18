module Atrapos.Data.L38 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 4 )
        , ( 1, 9 )
        , ( 2, 2 )
        , ( 2, 7 )
        , ( 3, 10 )
        , ( 5, 1 )
        , ( 7, 10 )
        , ( 8, 2)
        , ( 8, 7)
        , ( 9, 4)
        , ( 9, 9)
        ]
    , links =
        [ ( 1, [ 3, 4, 6 ] )
        , ( 2, [ 4, 5 ] )
        , ( 3, [ 6 ] )
        , ( 4, [ 5, 9 ] )
        , ( 5, [ 7 ] )
        , ( 6, [ 8, 10 ])
        , ( 7, [ 9, 11 ])
        , ( 8, [ 10 ])
        , ( 9, [ 10, 11 ])
        ]
    }
