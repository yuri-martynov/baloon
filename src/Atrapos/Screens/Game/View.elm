module Atrapos.Screens.Game.View exposing (view)

import Dict
import Svg exposing (Svg, svg, circle, g, defs)
import Svg.Attributes exposing (..)
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Node.View as Node
import Atrapos.Screens.Game.Objects.Node.Model as Node


view : Model -> Svg Msg
view model =
    svg_ model <|
        defs_ 
            -- :: Attack.view model
            :: view_ model


view_ : Model -> List (Svg Msg)
view_ { nodes } =
    nodes
        |> Dict.map node
        |> Dict.values


node : NodeId -> Node.Model -> Svg Msg
node id model =
    model
        |> Node.view
        |> Svg.map (NodeMsg id)


defs_ : Svg msg
defs_ =
    defs [] [ Node.template ]


svg_ : Model -> List (Svg msg) -> Svg msg
svg_ model =
    svg [ version "1.1", ViewBox.init model ]
