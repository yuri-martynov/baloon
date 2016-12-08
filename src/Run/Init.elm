module Run.Init exposing (init)

import Run.Model exposing (Model)
import Run.Msg exposing (Msg)


init : ( Model, Cmd Msg )
init =
    { screen = BlackScreen }
        ! [ BlackScreen.Init |> Cmd.map BlackScreenMsg ]
