module Run.Screens.Game.View exposing (view)

import Dict
import Svg exposing (Svg, svg, circle, g, defs)
import Svg.Attributes exposing (..)
import Common.ViewBox as ViewBox
import Run.Screens.Game.Model exposing (..)
import Run.Screens.Game.Msg exposing (..)
import Run.Screens.Game.Objects.Settlement.View as Settlement
import Run.Screens.Game.Objects.Settlement.Svg as Settlement
import Run.Screens.Game.Objects.Settlement.Model as Settlement


view : Model -> Svg Msg
view model =
    svg_ model
        ([ defs [] [Settlement.svg ]
        ] ++ 
        (view_ model))


view_ : Model -> List (Svg Msg)
view_ { settlements } =
    settlements
        |> Dict.map settlement
        |> Dict.values


settlement : SettlementId -> Settlement.Model -> Svg Msg
settlement id settlement =
    settlement
        |> Settlement.view
        |> Svg.map (SettlementMsg id)


svg_ : Model -> List (Svg Msg) -> Svg Msg
svg_ { windowSize, viewBoxWidth } =
    let
        size =
            ViewBox.size viewBoxWidth windowSize
    in
        svg [ version "1.1", ViewBox.init size ]
