module Atrapos.Screens.Game.Msg exposing (..)

import Common.Types exposing (Location)
import Atrapos.Screens.Game.Objects.Settlement.Msg as Settlement
import Atrapos.Screens.Game.Objects.Army.Msg as Army
import Atrapos.Screens.Game.Model exposing (SettlementId, ArmyId)


type Msg
    = SettlementMsg SettlementId Settlement.Msg
    | ArmyMsg ArmyId Army.Msg
    | AttackLocationChanged Location
    | AttackStart
 