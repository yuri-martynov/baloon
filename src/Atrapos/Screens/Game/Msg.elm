module Atrapos.Screens.Game.Msg exposing (..)

import Window
import Http
import Common.Types exposing (Location)
import Atrapos.Screens.Game.Node.Msg as Node
import Atrapos.Screens.Game.Link.Msg as Link
import Atrapos.Screens.Game.Model exposing (NodeId, LinkId)
import Atrapos.Screens.Game.Cmd as Cmd


type Msg
    = Init (Result Http.Error (Window.Size, Cmd.Level))
    | NodeMsg NodeId Node.Msg
    | LinkMsg LinkId Link.Msg
    | Help
    | Reset
    | Mouse MouseMsg
    | WindowSizeChanged Window.Size

type MouseMsg
    = Down
    | Move Location
    | Up
