module Common.Svg exposing (..)

import Svg exposing (Attribute)
import Svg.Attributes exposing (class)
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


classList : List ( String, Bool ) -> Attribute msg
classList classes =
    let
        class_ ( name, use ) =
            if use then
                Just name
            else
                Nothing
    in
        classes
            |> List.filterMap class_
            |> List.foldl (\a b -> a ++ " " ++ b) ""
            |> class
