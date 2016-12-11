module Atrapos.Screens.Game.Update exposing (updateWindowSize, update)

import Dict
import Window
import Return exposing (mapBoth)
import Common.Dict as Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Settlement.Msg as Settlement
import Atrapos.Screens.Game.Objects.Settlement.Update as Settlement
import Atrapos.Screens.Game.Objects.Settlement.Model as Settlement
import Atrapos.Screens.Game.Objects.Army.Update as Army
import Atrapos.Screens.Game.Objects.Army.Model as Army
import Atrapos.Screens.Game.Objects.Attack as Attack


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize s model =
    { model | windowSize = s } ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ settlements, armies, attack } as model) =
    case msg of
        SettlementMsg id (Settlement.AttackFrom) ->
            { model | attack = AttackLocation id Nothing } ! []

        AttackLocationChanged location ->
            { model | attack = attack |> Attack.updateLocation location } ! []

        SettlementMsg id (Settlement.AttackTo) ->
            { model | attack = attack |> Attack.updateSettlement id } ! []

        SettlementMsg _ (Settlement.AttackToCanceled) ->
            { model | attack = attack |> Attack.updateSettlementCanceled } ! []

        AttackStart ->
            model |> startAttack

        SettlementMsg id msg ->
            settlements
                |> Dict.justGet id
                |> Settlement.update msg
                |> mapBoth (SettlementMsg id) (settlement model id)

        ArmyMsg id msg ->
            armies
                |> Dict.justGet id
                |> Army.update msg
                |> mapBoth (ArmyMsg id) (army model id)


settlement : Model -> SettlementId -> Settlement.Model -> Model
settlement ({ settlements } as model) id settlement =
    { model | settlements = settlements |> Dict.insert id settlement }


army : Model -> ArmyId -> Army.Model -> Model
army ({ armies } as model) id army =
    { model | armies = armies |> Dict.insert id army }


startAttack : Model -> ( Model, Cmd Msg )
startAttack ({ attack, settlements } as model) =
    case attack of
        AttackFromTo from _ ->
            let
                settlementFrom =
                    settlements |> Dict.justGet from

                settlementFrom_ =
                    { settlementFrom | population = settlementFrom.population // 3 }
            in
                { model
                    | attack = NoAttack
                    , settlements = settlements |> Dict.insert from settlementFrom_
                }
                    ! []

        _ ->
            { model | attack = NoAttack } ! []
