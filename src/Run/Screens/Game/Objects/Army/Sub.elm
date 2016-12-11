module Run.Screens.Game.Objects.Army.Sub exposing (subscriptions)

import Run.Screens.Game.Objects.Army.Model exposing (..)
import Run.Screens.Game.Objects.Army.Msg exposing (Msg(Grow))
import Time exposing (every, second)


subscriptions : Model -> Sub Msg
subscriptions model =
    always Grow
        |> every second
 