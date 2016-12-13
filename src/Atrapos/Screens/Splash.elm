module Atrapos.Screens.Splash exposing (init, view)

import Html exposing (..)
import Window
import Common.WindowSize as WindowSize

init : (Window.Size -> msg) -> Cmd msg
init =
    WindowSize.init


view : Html msg
view =
    text "Loading..."



