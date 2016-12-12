module Atrapos.Sub exposing (subscriptions)

import Window
import Atrapos.Model exposing (..)
import Atrapos.Msg exposing (..)
import Atrapos.Screens.Game.Sub as Game


subscriptions : Model -> Sub Msg
subscriptions model =
    [ Window.resizes WindowSizeChanged
    , subscriptions_ model
    ]
        |> Sub.batch


subscriptions_ : Model -> Sub Msg
subscriptions_ model =
    case model of
        Game model ->
            Game.subscriptions model |> Sub.map GameMsg

        _ ->
            Sub.none
