module Atrapos.Screens.Game.Sub exposing (subscriptions)

import Dict
import Mouse
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions ({ nodes } as model) =
    Sub.none
    -- (model |> attack_)
        -- :: (nodes |> Dict.map settlement |> Dict.values)
        -- |> Sub.batch

-- attack_ : Model -> Sub Msg
-- attack_ { attack, windowSize, viewBoxWidth } =
--     case attack of
--         NoAttack ->
--             Sub.none

--         _ ->
--             [ Mouse.moves <|
--                 AttackLocationChanged
--                     << ViewBox.location_ viewBoxWidth windowSize
--             , Mouse.ups <| always AttackStart
--             ]
--                 |> Sub.batch
