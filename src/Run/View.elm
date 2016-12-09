module Run.View exposing (view)

import Run.Model exposing (Model, Screen(..))
import Run.Screens.Splash as Splash
import Run.Screens.Game.View as Game

view {screen} =
    case screen of
        Splash -> Splash.view
        Game model -> Game.view model
