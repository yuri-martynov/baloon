module Atrapos.Screens.Game.Update exposing (updateWindowSize, update)

import Dict
import Window
import Return exposing (mapBoth)
import Common.Dict as Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Node.Msg as Node
import Atrapos.Screens.Game.Objects.Node.Model as Node


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize s model =
    { model | windowSize = s } ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ nodes } as model) =
    model ! []
    -- case msg of
        -- NodeMsg id (Node.AttackFrom) ->
            -- { model | attack = AttackLocation id Nothing } ! []

        -- AttackLocationChanged location ->
            -- { model | attack = attack |> Attack.updateLocation location } ! []

        -- NodeMsg id (Node.AttackTo) ->
            -- { model | attack = attack |> Attack.updateNode id } ! []

        -- NodeMsg _ (Node.AttackToCanceled) ->
            -- { model | attack = attack |> Attack.updateNodeCanceled } ! []

        -- AttackStart ->
            -- model |> startAttack

        -- NodeMsg id msg ->
            -- nodes
                -- |> Dict.justGet id
                -- |> Node.update msg
                -- |> mapBoth (NodeMsg id) (mapNode model id)

        -- ArmyMsg id msg ->
        --     armies
        --         |> Dict.justGet id
        --         |> Army.update msg
        --         |> mapBoth (ArmyMsg id) (army model id)


-- mapNode : Model -> NodeId -> Node.Model -> Model
-- mapNode ({ nodes } as model) id node =
    -- { model | nodes = nodes |> Dict.insert id node }


-- startAttack : Model -> ( Model, Cmd Msg )
-- startAttack ({ attack, nodes } as model) =
--     case attack of
--         AttackFromTo from _ ->
--             let
--                 settlementFrom =
--                     nodes |> Dict.justGet from

--                 settlementFrom_ =
--                     { settlementFrom | population = settlementFrom.population // 3 }
--             in
--                 { model
--                     | attack = NoAttack
--                     , nodes = nodes |> Dict.insert from settlementFrom_
--                 }
--                     ! []

--         _ ->
--             { model | attack = NoAttack } ! []
