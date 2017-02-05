module Atrapos.Data.L11 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 1, 3 )
        , ( 1, 11 )
        , ( 3, 14 )
        , ( 3, 22 )
        , ( 4, 6 )
        , ( 4, 11 )
        , ( 7, 11 )
        , ( 7, 16 )
        , ( 8, 0 )
        , ( 8, 8 )
        , ( 10, 11 )
        , ( 10, 19 )
        ]
    , links =
        [ ( 1,      [ 2, 5, 9    ])
        , ( 2,      [ 3, 6       ])
        , ( 3,      [ 4, 6       ])
        , ( 4,      [ 8, 12      ])
        , ( 5,      [ 6, 7, 9    ])
        , ( 6,      [ 7, 8       ])
        , ( 7,      [ 8, 10, 11  ])
        , ( 8,      [ 12         ])
        , ( 9,      [ 10         ])
        , ( 10,     [ 11         ])
        , ( 11,     [ 12         ])
        ]
    }
