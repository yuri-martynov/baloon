module Atrapos.Screens.Game.Objects.Node.View exposing (view, template)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Common.Transform as Transform
import Atrapos.Screens.Game.Objects.Node.Model exposing (..)
import Atrapos.Screens.Game.Objects.Node.Msg exposing (..)


view : Model -> Svg Msg
view model =
    use
        [ xlinkHref "#node"
        , onMouseDown AttackFrom
        , onMouseOver AttackTo
        , onMouseOut AttackToCanceled
        ]
        []
        |> Transform.translate model


template : Svg msg
template =
    g [ id "node" ]
        [ circle [ r "25", fill "blue" ] []
        , circle [ r "10" ] []
        ]
