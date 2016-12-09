module Run.Screens.Splash exposing (init, view)

import Html exposing (..)
import Window
import Task


init : (Window.Size -> msg) -> Cmd msg
init msg =
    Window.size |> Task.perform msg


view : Html msg
view =
    text "Loading..."



