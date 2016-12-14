module Atrapos.Screens.Game.Sub exposing (subscriptions)

import Mouse
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions ({ selection } as model) =
    case selection of
        Nothing ->
            Mouse.downs <| Mouse << (always Down)

        Just _ ->
            [ Mouse.moves <| Mouse << Move << ViewBox.location model
            , Mouse.ups <| Mouse << (always Up)
            ]
                |> Sub.batch
