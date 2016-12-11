module Atrapos.Screens.Game.View exposing (view)

import Svg exposing (Svg, svg, circle, g, defs)
import Svg.Attributes exposing (..)
import Common.ViewBox as ViewBox
import Common.Dict exposing ((@))
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Node.View as Node
import Atrapos.Screens.Game.Objects.Link.View as Link


view : Model -> Svg Msg
view model =
    defs_ :: view_ model |> svg_ model


view_ : Model -> List (Svg Msg)
view_ ({ nodes, links } as model) =
    (links @ link model) ++ (nodes @ node)


link : Model -> LinkId -> Link -> Svg Msg
link model id link =
    link |> Link.view model |> Svg.map (LinkMsg id)


node : NodeId -> Node -> Svg Msg
node id node =
    node
        |> Node.view
        |> Svg.map (NodeMsg id)


defs_ : Svg msg
defs_ =
    defs [] [ Node.template, Link.stroke ]


svg_ : Model -> List (Svg msg) -> Svg msg
svg_ model =
    svg [ version "1.1", ViewBox.init model ]
