module Atrapos.Screens.Game.Objects.Settlement.Sub exposing (subscriptions)

import Atrapos.Screens.Game.Objects.Settlement.Model exposing (..)
import Atrapos.Screens.Game.Objects.Settlement.Msg exposing (Msg(Grow))
import Time exposing (every, second)


subscriptions : Model -> Sub Msg
subscriptions model =
    always Grow
        |> every second
 