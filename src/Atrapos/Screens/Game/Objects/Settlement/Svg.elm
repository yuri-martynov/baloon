module Atrapos.Screens.Game.Objects.Settlement.Svg exposing (town)

import Svg exposing (..)
import Svg.Attributes exposing (..)


town : Svg msg
town =
    g [id "town"]
        [ circle [ r "25", fill "blue" ] []
        , circle [ r "10" ] []
        ]
