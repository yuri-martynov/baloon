module Atrapos.View exposing (view)

import Html exposing (Html)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (Msg(..))
import Atrapos.Screens.Splash as Splash
import Atrapos.Screens.Levels.View as Levels
import Atrapos.Screens.Game.View as Game


view : Model -> Html Msg
view model =
    case model of
        Splash ->
            Splash.view

        Levels model ->
            Levels.view model |> Html.map LevelsMsg

        Game model ->
            Game.view model |> Html.map GameMsg
