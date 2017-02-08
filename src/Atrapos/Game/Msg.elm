module Atrapos.Game.Msg exposing (..)

import Window
import Common.Types exposing (Location)
import Atrapos.Data.Model as Level


type Msg
    = Init Window.Size
    | Help
    | Reset
    | Mouse MouseMsg
    | WindowSizeChanged Window.Size
    | Menu
    | Finished Level.Id


type MouseMsg
    = Down Location
    | Move Location
    | Up Location
