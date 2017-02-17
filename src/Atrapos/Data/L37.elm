module Atrapos.Data.L37 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 3 )
        , ( 1, 5 )
        , ( 2, 6 )
        , ( 2, 9 )
        , ( 4, 1 )
        , ( 4, 5 )
        , ( 4, 9 )
        , ( 6, 1)
        , ( 6, 4)
        , ( 7, 5)
        , ( 7, 7)
        ]
    , links =
        [ ( 1, [ 2, 6 ] )
        , ( 2, [ 3, 6 ] )
        , ( 3, [ 4, 6 ] )
        , ( 4, [ 6, 7 ] )
        , ( 5, [ 6 , 8 ] )
        , ( 6, [ 7, 8, 9, 10, 11 ])
        , ( 8, [ 9 ])
        , ( 9, [ 10 ])
        , ( 10, [ 11 ])
        ]
    }
