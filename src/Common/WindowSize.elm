module Common.WindowSize exposing (..)

import Window


type alias Model a =
    { a
        | windowSize : Window.Size
    }
