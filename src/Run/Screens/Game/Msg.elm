module Run.Screens.Game.Msg exposing (..)

import Common.Types exposing (Location)
import Run.Screens.Game.Objects.Settlement.Msg as Settlement
import Run.Screens.Game.Objects.Army.Msg as Army
import Run.Screens.Game.Model exposing (SettlementId, ArmyId)


type Msg
    = SettlementMsg SettlementId Settlement.Msg
    | ArmyMsg ArmyId Army.Msg
    | AttackLocationChanged Location
    | AttackStart
 