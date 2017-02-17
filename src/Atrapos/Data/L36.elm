module Atrapos.Data.L36 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 7 )
        , ( 1.5, 5 )
        , ( 2, 9 )
        , ( 2.5, 2 )
        , ( 4, 0 )
        , ( 4, 2 )
        , ( 4, 5 )
        , ( 4, 7)
        , ( 7, 7)
        , ( 6, 9)
        ]
    , links =
        [ ( 1, [ 3, 8 ] )
        , ( 2, [ 6, 7 ] )
        , ( 3, [ 8, 10 ] )
        , ( 4, [ 5, 6 ] )
        , ( 5, [  6 ] )
        , ( 6, [ 7 ])
        , ( 7, [ 8 ])
        , ( 8, [ 9, 10 ])
        , ( 9, [ 10 ])
        ]
    }
