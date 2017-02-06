module Atrapos.Data.L14 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [ ( 0, 0 )
        , ( 0, 10 )
        , ( 0, 22 )
        , ( 3, 5 )
        , ( 5, 13 )
        , ( 5, 19 )
        , ( 10, 0 )
        , ( 10, 10 )
        , ( 10, 16 )
        , ( 10, 22 )
        ]
    , links =
        [ ( 1,      [ 2, 4, 7    ])
        , ( 2,      [ 3, 4, 5, 6 ])
        , ( 3,      [ 6, 10      ])
        , ( 4,      [ 5, 7, 8    ])
        , ( 5,      [ 6, 8       ])
        , ( 6,      [ 9, 10      ])
        , ( 7,      [ 8          ])
        , ( 8,      [ 9          ])
        , ( 9,      [ 10         ])
        ]
    }
