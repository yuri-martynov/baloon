module Atrapos.Screens.Game.Model exposing (..)

import Window
import Dict exposing (Dict)
import Common.Types exposing (Location)
import Atrapos.Screens.Game.Objects.Settlement.Model as Settlement
import Atrapos.Screens.Game.Objects.Army.Model as Army


type alias Model =
    { windowSize : Window.Size
    , viewBoxWidth : Float
    , settlements : Dict SettlementId Settlement.Model
    , armies : Dict ArmyId Army.Model
    , attack: Attack
    }


type alias SettlementId =
    Int


type alias ArmyId =
    Int

type Attack
    = NoAttack
    | AttackLocation SettlementId (Maybe Location)
    | AttackFromTo SettlementId SettlementId
