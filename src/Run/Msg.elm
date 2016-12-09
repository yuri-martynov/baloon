module Run.Msg exposing (Msg(..))

import Window
import Run.Screens.Game.Msg as Game

type Msg
    = WindowSizeChanged Window.Size
    | GameMsg Game.Msg 
