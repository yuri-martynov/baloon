module Run.Screens.Game.Msg exposing (..)

import Run.Screens.Game.Objects.Settlement as Settlement


type Msg
    = SettlementMsg Int Settlement.Msg
 