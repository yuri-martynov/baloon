module Atrapos.Init exposing (init)

import Atrapos.Model exposing (Model(Splash))
import Atrapos.Msg exposing (Msg(WindowSizeChanged))
import Atrapos.Screens.Splash as Splash


init : ( Model, Cmd Msg )
init =
    ( Splash
    , Splash.init WindowSizeChanged
    )
