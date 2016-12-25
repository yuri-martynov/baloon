module Atrapos.Screens.Game.Msg exposing (..)

import Window
import Http
import Common.Types exposing (Location)
import Atrapos.Screens.Game.Cmd as Cmd


type Msg
    = Init (Result Http.Error (Window.Size, Cmd.Level))
    | Help
    | Reset
    | Mouse MouseMsg
    | WindowSizeChanged Window.Size

type MouseMsg
    = Down Location
    | Move Location
    | Up Location
