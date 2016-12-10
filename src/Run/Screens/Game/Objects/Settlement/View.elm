module Run.Screens.Game.Objects.Settlement.View exposing (view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Common.Transform as Transform
import Run.Screens.Game.Objects.Settlement.Model exposing (..)
import Run.Screens.Game.Objects.Settlement.Msg exposing (..)


view : Model -> Svg Msg
view ({ player, population } as model )=
    use [xlinkHref "#town", class ("player" ++ toString player)] []
        |> Transform.scale ((toFloat population) ^(0.05))
        |> Transform.translate model

