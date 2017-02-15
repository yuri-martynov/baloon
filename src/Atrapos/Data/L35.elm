module Atrapos.Data.L35 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 3 )
        , ( 1, 7 )
        , ( 2, 5 )
        , ( 2, 9 )
        , ( 2.5, 1 )
        , ( 5, 3 )
        , ( 5, 7 )
        , ( 5.5, 9)
        , ( 6, 5)
        , ( 7, 1)
        ]
    , links =
        [ ( 1, [ 2, 3, 5, 6 ] )
        , ( 2, [ 3, 4, 7 ] )
        , ( 3, [   9 ] )
        , ( 4, [ 8 ] )
        , ( 5, [  10 ] )
        , ( 6, [ 9, 10 ])
        , ( 7, [ 8, 9 ])
        , ( 8, [ 9 ])
        , ( 9, [ 10 ])
        ]
    }
