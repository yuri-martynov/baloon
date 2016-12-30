module Atrapos.Game.Msg exposing (..)

import Window
import Mouse
import Http
import Common.Types exposing (Location)
import Atrapos.Game.Cmd as Cmd


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
    | Click
    | EdgeSwipe



down: (Mouse.Position -> Location) -> Mouse.Position -> MouseMsg
down location mouse =
    if mouse.x < 10 then 
        EdgeSwipe 
    else 
        mouse |> location |> Down
