module Atrapos.Screens.Game.View exposing (view)

import Dict
import Svg exposing (Svg, svg, circle, g, defs)
import Svg.Attributes exposing (..)
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Settlement.View as Settlement
import Atrapos.Screens.Game.Objects.Settlement.Svg as Settlement
import Atrapos.Screens.Game.Objects.Settlement.Model as Settlement
import Atrapos.Screens.Game.Objects.Attack as Attack


view : Model -> Svg Msg
view model =
    svg_ model <|
        defs_
            :: Attack.view model
            :: view_ model


view_ : Model -> List (Svg Msg)
view_ { settlements, attack } =
    settlements
        |> Dict.map settlement
        |> Dict.values


settlement : SettlementId -> Settlement.Model -> Svg Msg
settlement id settlement =
    settlement
        |> Settlement.view
        |> Svg.map (SettlementMsg id)


defs_ : Svg msg
defs_ =
    defs [] [ Settlement.town ]


svg_ : Model -> List (Svg msg) -> Svg msg
svg_ { windowSize, viewBoxWidth } =
    let
        size =
            ViewBox.size viewBoxWidth windowSize
    in
        svg [ version "1.1", ViewBox.init size ]
