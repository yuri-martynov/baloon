module Common.Transform exposing (..)

import Svg exposing (Svg, g)
import Svg.Attributes exposing (transform)
import Common.Types exposing (Location_)


translate : Location_ a -> Svg.Attribute msg
translate { x, y } =
    "translate("
        ++ (x |> toString)
        ++ " "
        ++ (y |> toString)
        ++ ")"
        |> transform


scale : number -> Svg msg -> Svg msg
scale s element =
    g
        [ "scale("
            ++ (s |> toString)
            ++ ")"
            |> transform
        ]
        [ element ]
