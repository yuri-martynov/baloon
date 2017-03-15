module Atrapos.Data.L47 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 4 )
        , ( 0, 8 )
        , ( 3, 1 )
        , ( 6, 4)
        , ( 6, 8 )
        ]
    , links =
        [ ( 1, [ 4, 5 ] )
        , ( 2, [ 3, 4 ] )
        , ( 3, [ 5 ])
        
        ]
    }
