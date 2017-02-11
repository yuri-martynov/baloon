module Atrapos.Levels.Sub exposing (subscriptions)

import Atrapos.Levels.Msg exposing (Msg(MaxLevel))
import Atrapos.Port as Port


subscriptions : model -> Sub Msg
subscriptions _ =
    Port.maxLevel MaxLevel
