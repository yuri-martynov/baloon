module Atrapos.Game.Msg exposing (..)

import Window
import Mouse
import Http
import Common.Types exposing (Location)


type Msg
    = Init Window.Size
    | Help
    | Reset
    | Mouse MouseMsg
    | WindowSizeChanged Window.Size
    | Menu


type MouseMsg
    = Down Location
    | Move Location
    | Up Location
