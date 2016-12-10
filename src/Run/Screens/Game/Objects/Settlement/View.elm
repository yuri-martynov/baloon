module Run.Screens.Game.Objects.Settlement.View exposing (view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Common.Translate as Translate
import Run.Screens.Game.Objects.Settlement.Model exposing (..)
import Run.Screens.Game.Objects.Settlement.Msg exposing (..)


view : Model -> Svg Msg
view ({ player, population } as model )=
    use [xlinkHref "#town", class ("player" ++ toString player)] []
        |> Translate.location model

playerColor player =
    case player of
        0 ->
            "red"

        1 ->
            "blue"

        _ ->
            "black"
