module Ballon.Sub exposing (subscriptions)

import Mouse
import Ballon.Model exposing (Model, State(..))
import Ballon.Msg exposing (..)
import Time exposing (second)


subscriptions : Model -> Sub Msg
subscriptions { state } =
    case state of
        Na ->
            Mouse.downs (always Start)

        Blowing _ ->
            [ Mouse.ups (always Stop)
            , Time.every (second / 30.0) (always Blow)
            ]
                |> Sub.batch

        Fly _ ->
            Time.every (second / 30.0) (always Up)
