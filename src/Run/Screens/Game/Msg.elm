module Run.Screens.Game.Msg exposing (..)

import Run.Screens.Game.Objects.Settlement.Msg as Settlement


type Msg
    = SettlementMsg Int Settlement.Msg
 