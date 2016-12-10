module Run.Screens.Game.Objects.Settlement.Svg exposing (svg)

import Svg exposing (..)
import Svg.Attributes exposing (..)


svg : Svg msg
svg =
    g [id "town"]
        [ circle [ r "50", fill "blue" ] []
        , circle [ r "25" ] []
        ]
