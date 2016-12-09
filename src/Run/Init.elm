module Run.Init exposing (init)

import Run.Model exposing (Model(Splash))
import Run.Msg exposing (Msg(WindowSizeChanged))
import Run.Screens.Splash as Splash


init : ( Model, Cmd Msg )
init =
    ( Splash
    , Splash.init WindowSizeChanged
    )
