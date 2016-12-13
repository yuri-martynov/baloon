module Common.WindowSize exposing (..)

import Window
import Task


type alias Model a =
    { a
        | windowSize : Window.Size
    }


init : (Window.Size -> msg) -> Cmd msg
init msg =
    Window.size |> Task.perform msg
