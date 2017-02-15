module Atrapos.Data.L33 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 6.5 )
        , ( 2.3, 7.6 )
        , ( 5, 1 )
        , ( 5, 5 )
        , ( 7, 0 )
        , ( 8.6, 6.4 )
        , ( 8.6, 9 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4 ] )
        , ( 2, [ 4, 7 ] )
        , ( 3, [ 4, 5 ] )
        , ( 4, [ 5, 6, 7 ] )
        , ( 5, [ 6 ] )
        , ( 6, [ 7 ])
        ]
    }
