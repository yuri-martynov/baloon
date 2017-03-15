module Atrapos.Data.L41 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 1 )
        , ( 1, 7 )
        , ( 1, 13 )
        , ( 4, 0 )
        , ( 4, 2 )
        , ( 4, 7 )
        , ( 6, 0 )
        , ( 6, 2 )
        , ( 6, 7 )
        , ( 9, 1 )
        , ( 9, 7 )
        , ( 9, 13 )
        ]
    , links =
        [ ( 1, [ 2, 4, 6 ] )
        , ( 2, [ 3, 6 ] )
        , ( 3, [ 6, 12 ] )
        , ( 4, [ 5 ] )
        , ( 5, [ 6, 8 ] )
        , ( 6, [ 9 ])
        , ( 7, [ 8, 10 ])
        , ( 8, [ 9 ])
        , ( 9, [ 10, 11, 12 ])
        , ( 10, [ 11 ])
        , ( 11, [ 12 ])
        ]
    }
