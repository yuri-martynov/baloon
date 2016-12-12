module Atrapos.Msg exposing (Msg(..))

import Window
import Atrapos.Screens.Game.Msg as Game
import Atrapos.Screens.Levels.Msg as Levels

type Msg
    = WindowSizeChanged Window.Size
    | LevelsMsg Levels.Msg
    | GameMsg Game.Msg 
