module Atrapos.Screens.Game.Sub exposing (subscriptions)

import Dict
import Mouse
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Settlement.Sub as Settlement
import Atrapos.Screens.Game.Objects.Settlement.Model as Settlement


subscriptions : Model -> Sub Msg
subscriptions ({ settlements } as model) =
    (model |> attack_)
        :: (settlements |> Dict.map settlement |> Dict.values)
        |> Sub.batch


settlement : SettlementId -> Settlement.Model -> Sub Msg
settlement id settlement =
    settlement
        |> Settlement.subscriptions
        |> Sub.map (SettlementMsg id)


attack_ : Model -> Sub Msg
attack_ { attack, windowSize, viewBoxWidth } =
    case attack of
        NoAttack ->
            Sub.none

        _ ->
            [ Mouse.moves <|
                AttackLocationChanged
                    << ViewBox.location_ viewBoxWidth windowSize
            , Mouse.ups <| always AttackStart
            ]
                |> Sub.batch
