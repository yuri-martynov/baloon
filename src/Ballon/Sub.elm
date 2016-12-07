module Ballon.Sub exposing (subscriptions)

import Mouse
import Common.WindowSize as WindowSize
import Ballon.Model exposing (Model, State(..))
import Ballon.Msg exposing (..)
import Time exposing (second)


subscriptions : Model -> Sub Msg
subscriptions model =
    [ WindowSize.subscriptions WindowSizeChanged
    , subscriptions_ model
    ]
        |> Sub.batch


subscriptions_ : Model -> Sub Msg
subscriptions_ { state } =
    case state of
        Na ->
            Mouse.downs Start

        Blowing _ ->
            [ Mouse.ups (always Stop)
            , Time.every (second / 30.0) (always Blow)
            ]
                |> Sub.batch

        Flying _ ->
            Time.every (second / 30.0) (always Up)
