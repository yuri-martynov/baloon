module Atrapos.Screens.Game.Sub exposing (subscriptions)

import Window
import Mouse
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of 
        Loading -> 
            Sub.none

        Loaded ({ selection } as model) ->
            case selection of
                Nothing ->
                    [ Mouse.downs <| Mouse << (always Down)
                    , Window.resizes WindowSizeChanged
                    ] 
                        |> Sub.batch

                Just _ ->
                    [ Mouse.moves <| Mouse << Move << ViewBox.location model
                    , Mouse.ups <| Mouse << (always Up)
                    , Window.resizes WindowSizeChanged
                    ]
                        |> Sub.batch
