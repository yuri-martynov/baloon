module Run.Screens.Game.Sub exposing (subscriptions)

import Dict
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Msg exposing (..)
import Run.Screens.Game.Objects.Settlement.Sub as Settlement
import Run.Screens.Game.Objects.Settlement.Model as Settlement


subscriptions : Model -> Sub Msg
subscriptions { settlements } =
    settlements
        |> Dict.map settlement
        |> Dict.values
        |> Sub.batch

settlement: Int -> Settlement.Model -> Sub Msg
settlement id settlement =
    settlement
        |> Settlement.subscriptions
        |> Sub.map (SettlementMsg id)