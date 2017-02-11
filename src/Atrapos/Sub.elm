module Atrapos.Sub exposing (subscriptions)

import Atrapos.Model exposing (..)
import Atrapos.Msg exposing (..)
import Atrapos.Game.Sub as Game
import Atrapos.Levels.Sub as Levels


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Game model ->
            model 
                |> Game.subscriptions 
                |> Sub.map GameMsg

        Levels model ->
            model
                |> Levels.subscriptions 
                |> Sub.map LevelsMsg

        _ ->
            Sub.none
