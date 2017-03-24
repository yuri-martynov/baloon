module Atrapos.Game.View exposing (view)

import Mouse
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import TouchEvents as Touch exposing (Touch, onTouchEvent)
import Common.ViewBox as ViewBox
import Common.Dict exposing ((@))
import Common.Types exposing (Size, Padding)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Node.View as Node
import Atrapos.Game.Link.View as Link
import Atrapos.Game.UI as UI
import Atrapos.Game.Selection.View as Selection


view : Model -> Svg Msg
view model =
    case model of
        Loading _ ->
            [ text_ [] [ text "loading" ] ] |> svg []

        Loaded model ->
            defs_ :: view_ model |> svg_ model
            
                |> UI.view model


view_ : Model_ -> List (Svg Msg)
view_ ({ nodes, links, selection } as model) =
    (links @ link model) ++ (nodes @ node model) ++ [ selection |> Selection.view nodes ]


link : Model_ -> LinkId -> Link -> Svg Msg
link model id link =
    link |> Link.view model


node : Model_ -> NodeId -> Node -> Svg Msg
node model id node =
    node
        |> Node.view model id


defs_ : Svg msg
defs_ =
    defs [] [ Link.stroke ]


svg_ : Model_ -> List (Svg Msg) -> Svg Msg
svg_ model =
    let
        location =
            ViewBox.location model

        touch event msg =
            onTouchEvent event
                (Mouse << msg << position)

        events =
            [ touch Touch.TouchStart <| Down << location
            , touch Touch.TouchEnd <| Up << location
            , touch Touch.TouchMove <| Move << location
            ]
    in
        [ version "1.1"
        , class "game-field"
        , ViewBox.init model
        ]
            ++ events
            |> svg


position : Touch -> Mouse.Position
position { clientX, clientY } =
    { x = round clientX, y = round clientY }


