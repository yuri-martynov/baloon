module Run.Screens.Game.Objects.Settlement.View exposing (view)

import Svg exposing (Svg, svg, circle, g)
import Svg.Attributes exposing (..)
import Run.Screens.Game.Objects.Settlement.Model exposing (..)
import Run.Screens.Game.Objects.Settlement.Msg exposing (..)


view : Model -> Svg Msg
view { player, x, y, population } =
    circle
        [ x |> toString |> cx
        , y |> toString |> cy
        , population |> toString |> r
        , player |> playerColor |> fill
        ]
        []


playerColor player =
    case player of
        0 ->
            "red"

        1 ->
            "blue"

        _ ->
            "black"
