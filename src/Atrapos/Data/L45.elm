module Atrapos.Data.L45 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 9 )
        , ( 4, 0 )
        , ( 6, 7 )
        
        ]
    , links =
        [ ( 1, [ 2, 3 ] )
        , ( 2, [ 3 ] )
        ]
    }
