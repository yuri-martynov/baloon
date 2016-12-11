module Atrapos.Screens.Game.Objects.Army.View exposing (view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Common.Transform as Transform
import Atrapos.Screens.Game.Objects.Army.Model exposing (..)
import Atrapos.Screens.Game.Objects.Army.Msg exposing (..)


view : Model -> Svg Msg
view ({ player, population } as model )=
    use [xlinkHref "#town", class ("player" ++ toString player)] []
        |> Transform.scale ((toFloat population) ^(0.05))
        |> Transform.translate model

