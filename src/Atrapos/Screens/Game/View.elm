module Atrapos.Screens.Game.View exposing (view)

import Dict
import Svg exposing (Svg, svg, circle, g, defs)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Common.ViewBox as ViewBox
import Common.Dict exposing ((@))
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Node.View as Node
import Atrapos.Screens.Game.Link.View as Link
import Atrapos.Screens.Game.Selection.Path as Selection


view : Model -> Svg Msg
view model =
    defs_ :: help model :: reset model :: view_ model |> svg_ model


view_ : Model -> List (Svg Msg)
view_ ({ nodes, links } as model) =
    (links @ link model) ++ (nodes @ node)


help : Model -> Svg Msg
help { victory } =
    let
        class_ =
            if victory then
                "victory"
            else
                "help"
    in
        circle [ r "4", class class_, onClick Help ] []


reset : Model -> Svg Msg
reset { links } =
    case links |> Dict.values |> List.any .selected of
        True ->
            circle [ r "4", cx "10", class "reset", onClick Reset ] []

        False ->
            g [] []


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


progress : Model -> Float
progress { links, minLen } =
    let
        len =
            links
                |> Selection.selected
                |> Selection.len links
    in
        len / minLen
