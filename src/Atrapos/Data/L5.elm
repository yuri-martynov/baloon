module Atrapos.Data.L5 exposing (model)

import Atrapos.Data.Model exposing (..)


model : Model
model =
    { nodes =
        [  (2, 8 )
        ,  (3, 1 )
        ,  (5, 22 )
        ,  (5, 11 )
        ,  (6, 9 )
        ,  (7, 4 )
        ,  (7, 14) 
        ,  (7, 18 )
        ,  (8, 16 )
        ,  (10, 1 )
        ,  (10, 22 )
        ,  (11, 18 )
        ]
    , links =
        [  (1,      [ 2, 3, 4, 6 ] )
        ,  (2,      [ 5, 6, 10   ] )
        ,  (3,      [ 8, 11, 12  ] )
        ,  (4,      [ 5          ] )
        ,  (6,      [ 7          ] )
        ,  (7,      [ 10         ] )
        ,  (8,      [ 9, 11, 12  ] )
        ,  (11,     [ 12         ] )
        ]
    }
