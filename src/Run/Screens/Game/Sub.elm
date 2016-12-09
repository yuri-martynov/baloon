module Run.Screens.Game.Sub exposing (..)

import Dict
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Msg exposing (..)
import Run.Screens.Game.Objects.Settlement as Settlement


subscriptions : Model -> Sub Msg
subscriptions { settlements } =
    settlements
        |> Dict.map (\k v -> Settlement.subscriptions v |> Sub.map (SettlementMsg k))
        |> Dict.values
        |> Sub.batch
