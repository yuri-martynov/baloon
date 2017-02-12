module Common.Math exposing (..)

import Common.Types exposing (Location_)


len : Location_ a -> Location_ b -> Float
len a b =
    sqrt ((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2)


angle : Location_ a -> Location_ b -> Float
angle a b =
    atan2 (b.y - a.y) (a.x - b.x)


intersect : Location_ a -> Location_ b -> Location_ c -> Location_ d -> Bool
intersect a b c d =
    let
        area a b c =
            (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)

        sort a b =
            if (a > b) then
                ( b, a )
            else
                ( a, b )

        intersect_ a b c d =
            let
                ( a_, b_ ) =
                    sort a b

                ( c_, d_ ) =
                    sort c d
            in
                max a_ c_ <= max b_ d_
    in
        intersect_ a.x b.x c.x d.x
            && intersect_ a.y b.y c.y d.y
            && (area a b c)
            * (area a b d)
            <= 0
            && (area c d a)
            * (area c d b)
            <= 0
