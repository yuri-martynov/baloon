module Run.Sub exposing (subscriptions)

import Window
import Run.Model exposing (..)
import Run.Msg exposing (..)
import Run.Screens.Game.Sub as Game


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
        _ -> Sub.none
