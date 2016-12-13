module Atrapos.Screens.Game.Sub exposing (subscriptions)

import Dict
import Mouse
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions ({ selection } as model) =
    case selection of
        Nothing ->
            Mouse.downs <|
                Mouse
                    << (always Down)

        Just _ ->
            [ Mouse.moves <| Mouse << Move << ViewBox.location model
            , Mouse.ups <| Mouse << (always Up)
            ]
                |> Sub.batch



-- Sub.none
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
