module Common.Transform exposing (..)

import Svg exposing (Svg, g)
import Svg.Attributes exposing (transform)
import Common.Types exposing (Location_)


translate : Location_ a -> Svg msg -> Svg msg
translate { x, y } element =
    g
        [ "translate("
            ++ (x |> toString)
            ++ " "
            ++ (y |> toString)
            ++ ")"
            |> transform
        ]
        [ element ]


scale : number -> Svg msg -> Svg msg
scale s element =
    g
        [ "scale("
            ++ (s |> toString)
            ++ ")"
            |> transform
        ]
        [ element ]
