module Common.Translate exposing (..)

import Svg exposing (Svg, g)
import Svg.Attributes exposing (transform)
import Common.Types exposing (Location_)


location : Location_ a -> Svg msg -> Svg msg
location { x, y } element =
    g
        [ "translate("
            ++ (x |> toString)
            ++ " "
            ++ (y |> toString)
            ++ ")"
            |> transform
        ]
        [ element ]
