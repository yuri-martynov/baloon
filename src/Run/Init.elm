module Run.Init exposing (init)

import Run.Model exposing (Model, Screen(Splash))
import Run.Msg exposing (Msg(..))
import Run.Screens.Splash as Splash


init : ( Model, Cmd Msg )
init =
    { screen = Splash }
        ! [ Splash.init WindowSizeChanged ]
