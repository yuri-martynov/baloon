module Common.Math exposing (..)

import Common.Types exposing (Location_)


len : Location_ a -> Location_ b -> Float
len a b =
    sqrt ((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2)
