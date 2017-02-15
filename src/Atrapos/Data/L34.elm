module Atrapos.Data.L34 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 5 )
        , ( 1.4, 3.6 )
        , ( 2, 10 )
        , ( 4, 1 )
        , ( 4, 5 )
        , ( 4, 9 )
        , ( 6, 0 )
        , ( 6.5, 6.5)
        , ( 8, 5)
        ]
    , links =
        [ ( 1, [ 2, 3, 5 ] )
        , ( 2, [ 5 ] )
        , ( 3, [ 5, 6 ] )
        , ( 4, [ 5, 7 ] )
        , ( 5, [ 6, 7, 8, 9 ] )
        , ( 7, [ 9 ])
        , ( 8, [ 9 ])
        ]
    }
