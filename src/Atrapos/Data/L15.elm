module Atrapos.Data.L15 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 2, 4 )
        , ( 2, 14 )
        , ( 2, 17 )
        , ( 8, 10 )
        , ( 8, 14 )
        , ( 9, 4 )
        , ( 7, 7 )
        , ( 11, 6 )
        , ( 11, 14 )
        , ( 11, 17 )
        , ( 2, 7 )
        ]
    , links =
        [ ( 1,      [ 6, 11      ])
        , ( 2,      [ 3, 5, 7    ])
        , ( 3,      [ 10         ])
        , ( 4,      [ 5, 8       ])
        , ( 5,      [ 10         ])
        , ( 6,      [ 7          ])
        , ( 7,      [ 11         ])
        , ( 8,      [ 9          ])
        ]
    }
