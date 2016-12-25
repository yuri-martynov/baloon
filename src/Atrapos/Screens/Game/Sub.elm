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
            let 
                mouse msg = Mouse << msg << ViewBox.location model 
                resizes = Window.resizes WindowSizeChanged
            in
                case selection of
                    None ->
                        [ Mouse.downs <| mouse Down
                        , resizes
                        ] 
                            |> Sub.batch

                    _ ->
                        [ Mouse.moves <| mouse Move
                        , Mouse.ups <| mouse Up
                        , resizes
                        ]
                            |> Sub.batch


