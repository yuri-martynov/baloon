module Ballon.Init exposing (init)

import Common.WindowSize as WindowSize
import Ballon.Model exposing (Model, State(Na))
import Ballon.Msg exposing (Msg(NoOp, WindowSizeChanged))


init : ( Model, Cmd Msg )
init =
    { state = Na
    , windowSize = Nothing
    }
        ! [ WindowSize.init NoOp WindowSizeChanged ]
