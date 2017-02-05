module Atrapos.Data.L4 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [  (0, 2) 
        ,  (0, 20) 
        ,  (2, 8 )
        ,  (3, 11 )
        ,  (6, 3 )
        ,  (6, 20 )
        ,  (9, 11 )
        ,  (10, 8 )
        ,  (12, 2 )
        ,  (12, 20 )
        ]
    , links =
        [  (1,      [2, 3, 5, 8 ])
        ,  (2,      [4, 6       ])
        ,  (3,      [4, 9       ])
        ,  (4,      [5, 6, 7    ])
        ,  (5,      [6, 7, 9    ])
        ,  (6,      [7, 10      ])
        ,  (7,      [8, 10      ])
        ,  (8,      [9          ])
        ,  (9,      [10         ])
        ]
    }
