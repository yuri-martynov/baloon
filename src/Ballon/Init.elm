module Ballon.Init exposing (init)

import Ballon.Model exposing (Model, State(Na))
import Ballon.Msg exposing (Msg)

init: (Model, Cmd Msg)
init =
    { state = Na} ! []