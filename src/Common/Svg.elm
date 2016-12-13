module Common.Svg exposing (..)

import Common.Types exposing (Location_)


dLine : Location_ a -> Location_ b -> String
dLine n1 n2 =
    "M"
        ++ (n1.x |> toString)
        ++ " "
        ++ (n1.y |> toString)
        ++ " L"
        ++ (n2.x |> toString)
        ++ " "
        ++ (n2.y |> toString)
