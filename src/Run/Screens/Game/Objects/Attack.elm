module Run.Screens.Game.Objects.Attack exposing (updateLocation, updateSettlement, updateSettlementCanceled, view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Common.Dict as Dict
import Common.Types exposing (..)
import Run.Screens.Game.Model as Game exposing (Attack(..), SettlementId)
import Run.Screens.Game.Objects.Settlement.Model as Settlement


-- UPDATE


updateLocation : Location -> Game.Attack -> Game.Attack
updateLocation location attack =
    case attack of
        AttackLocation settlementId _ ->
            AttackLocation settlementId (Just location)

        _ ->
            attack


updateSettlement : SettlementId -> Game.Attack -> Game.Attack
updateSettlement to attack =
    let
        update from =
            if (from == to) then
                attack
            else
                AttackFromTo from to
    in
        case attack of
            AttackLocation from _ ->
                update from

            AttackFromTo from _ ->
                update from

            _ ->
                attack


updateSettlementCanceled : Game.Attack -> Game.Attack
updateSettlementCanceled attack =
    case attack of
        AttackFromTo from _ ->
            AttackLocation from Nothing

        _ ->
            attack



-- VIEW


view : Game.Model -> Svg msg
view { attack, settlements } =
    case attack of
        AttackLocation settlementId (Just position) ->
            settlements
                |> Dict.justGet settlementId
                |> viewToLocation position

        AttackFromTo from to ->
            viewFromTo (settlements |> Dict.justGet from) (settlements |> Dict.justGet to)

        _ ->
            g [] []


viewToLocation : Location -> Settlement.Model -> Svg msg
viewToLocation location settlement =
    line
        [ settlement.x |> toString |> x1
        , settlement.y |> toString |> y1
        , location.x |> toString |> x2
        , location.y |> toString |> y2
        , strokeWidth "1"
        , stroke "black"
        ]
        []


viewFromTo : Settlement.Model -> Settlement.Model -> Svg msg
viewFromTo from to =
    line
        [ from.x |> toString |> x1
        , from.y |> toString |> y1
        , to.x |> toString |> x2
        , to.y |> toString |> y2
        , strokeWidth "3"
        , stroke "red"
        ]
        []
