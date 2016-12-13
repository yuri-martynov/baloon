module Atrapos.Screens.Game.Objects.Node.View exposing (view, template)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Common.Transform as Transform
import Atrapos.Screens.Game.Model exposing (Node)
import Atrapos.Screens.Game.Objects.Node.Msg exposing (..)


view : Node -> Svg Msg
view model =
    use
        [ xlinkHref "#node"
        -- , onMouseOver Over
        ]
        []
        |> Transform.translate model


template : Svg msg
template =
    g [ id "node" ]
        [ circle [ r "0.5", class "node" ] []
        ]
