module Atrapos.Msg exposing (Msg(..))

import Window
import Atrapos.Routes exposing (Route)
import Atrapos.Game.Msg as Game
import Atrapos.Levels.Msg as Levels


type Msg
    = UrlChanged Route
    | LevelsMsg Levels.Msg
    | GameMsg Game.Msg
