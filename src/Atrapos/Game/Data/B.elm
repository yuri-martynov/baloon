module Atrapos.Game.Data.B exposing (model)

import Atrapos.Game.Data.Model exposing (..)

model: Model
model =
    { nodes = 
        [ ( 1, 1  )
        , ( 1, 13 )
        , ( 3, 7  )
        , ( 5, 13 )
        , ( 5, 20 )
        , ( 7, 7  )
        , ( 8, 16 )
        , ( 9, 1 )
        ]
    , links = 
        [ ( 1,      [3, 6, 8    ])
        , ( 2,      [3, 4, 5    ])
        , ( 3,      [4, 6, 8    ])
        , ( 4,      [5, 6, 7    ])
        , ( 5,      [7          ])
        , ( 6,      [7, 8       ])
        ]
    }
