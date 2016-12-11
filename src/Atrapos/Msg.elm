module Atrapos.Msg exposing (Msg(..))

import Window
import Atrapos.Screens.Game.Msg as Game

type Msg
    = WindowSizeChanged Window.Size
    | GameMsg Game.Msg 
