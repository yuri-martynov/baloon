module Run.View exposing (view)

import Html exposing (Html)
import Run.Model exposing (Model(..))
import Run.Msg exposing (Msg)
import Run.Screens.Splash as Splash
import Run.Screens.Game.View as Game

view : Model -> Html Msg
view model =
    case model of
        Splash -> Splash.view
        Game model -> Game.view model
