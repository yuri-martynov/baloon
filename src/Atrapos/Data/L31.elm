module Atrapos.Data.L31 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 5 )
        , ( 3, 0 )
        , ( 3, 5 )
        , ( 3, 11 )
        , ( 6, 7 )
        ]
    , links =
        [ ( 1, [ 2, 3, 4 ] )
        , ( 2, [ 3, 5 ] )
        , ( 3, [ 4, 5 ] )
        , ( 4, [ 5 ] )
        ]
    }
