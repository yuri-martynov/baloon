module Atrapos.Levels.Sub exposing (subscriptions)

import Atrapos.Levels.Msg exposing (Msg(GotLevel))
import Atrapos.Port as Port


subscriptions : model -> Sub Msg
subscriptions _ =
    Port.level GotLevel
