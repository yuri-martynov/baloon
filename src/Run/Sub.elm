module Run.Sub exposing (subscriptions)

import Window
import Run.Model exposing (..)
import Run.Msg exposing (Msg(WindowSizeChanged))


subscriptions : Model -> Sub Msg
subscriptions model =
    Window.resizes WindowSizeChanged
