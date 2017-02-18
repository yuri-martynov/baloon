module Atrapos.Data.L39 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 4 )
        , ( 1.2, 5.6 )
        , ( 2, 10 )
        , ( 2.2, 2 )
        , ( 4, 8 )
        , ( 4, 0 )
        , ( 4, 5 )
        , ( 6, 1)
        , ( 7, 5)
        , ( 8, 1)
        , ( 8, 8)
        ]
    , links =
        [ ( 1, [ 2, 4, 7 ] )
        , ( 2, [ 3, 7 ] )
        , ( 3, [ 5, 7 ] )
        , ( 4, [ 6, 7 ] )
        , ( 5, [ 7, 11 ] )
        , ( 6, [ 7, 8 ])
        , ( 7, [ 8, 9, 10, 11 ])
        , ( 8, [ 10 ])
        , ( 9, [ 10, 11 ])
        ]
    }
