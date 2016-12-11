module Atrapos.Screens.Game.Objects.Settlement.View exposing (view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Common.Transform as Transform
import Atrapos.Screens.Game.Objects.Settlement.Model exposing (..)
import Atrapos.Screens.Game.Objects.Settlement.Msg exposing (..)


view : Model -> Svg Msg
view ({ player, population } as model) =
    use
        [ xlinkHref "#town"
        , class ("player" ++ toString player)
        , onMouseDown AttackFrom
        , onMouseOver AttackTo
        , onMouseOut AttackToCanceled 
        ]
        []
        |> Transform.scale ((toFloat population) ^ (0.05))
        |> Transform.translate model
