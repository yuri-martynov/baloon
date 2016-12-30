module Atrapos.View exposing (view)

import Html exposing (Html, text)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (Msg(..))
import Atrapos.Levels.View as Levels
import Atrapos.Game.View as Game


view : Model -> Html Msg
view model =
    case model of
        NotFound ->
            viewNotFound

        Levels model ->
            Levels.view model |> Html.map LevelsMsg

        Game model ->
            Game.view model |> Html.map GameMsg

viewNotFound : Html msg
viewNotFound =
    text "not found... redirecting..."
