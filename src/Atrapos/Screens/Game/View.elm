module Atrapos.Screens.Game.View exposing (view)

import Dict
import Mouse
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Common.ViewBox as ViewBox
import Common.Dict exposing ((@))
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Node.View as Node
import Atrapos.Screens.Game.Link.View as Link
import Atrapos.Screens.Game.Shared as Game
import TouchEvents as Touch exposing (Touch, onTouchEvent)


view : Model -> Svg Msg
view model =
    defs_ :: help model :: reset model :: progress model :: view_ model |> svg_ model


view_ : Model -> List (Svg Msg)
view_ ({ nodes, links } as model) =
    (links @ link model) ++ (nodes @ node model)


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


progress : Model -> Svg Msg
progress model =
    text_ [ x "10", y "2", class "progress" ] [ model |> Game.progress |> toString |> text ]


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


node : Model -> NodeId -> Node -> Svg Msg
node model id node =
    node
        |> Node.view model id
        |> Svg.map (NodeMsg id)


defs_ : Svg msg
defs_ =
    defs [] [ Link.stroke ]


svg_ : Model -> List (Svg Msg) -> Svg Msg
svg_ model =
    svg
        [ version "1.1"
        , ViewBox.init model
        , onTouchEvent Touch.TouchStart (Mouse << (always Down))
        , onTouchEvent Touch.TouchMove (Mouse << Move << ViewBox.location model << position)
        , onTouchEvent Touch.TouchEnd (Mouse << (always Up))
        ] 


position : Touch -> Mouse.Position
position { clientX, clientY } =
    { x = round clientX, y = round clientY }
 