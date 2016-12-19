module Atrapos.Sub exposing (subscriptions)

import Atrapos.Model exposing (..)
import Atrapos.Msg exposing (..)
import Atrapos.Screens.Game.Sub as Game

subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Game model ->
            Game.subscriptions model |> Sub.map GameMsg

        _ ->
            Sub.none
