module Run.Screens.Game.Msg exposing (..)

import Run.Screens.Game.Objects.Settlement.Msg as Settlement
import Run.Screens.Game.Model exposing (SettlementId)


type Msg
    = SettlementMsg SettlementId Settlement.Msg
 