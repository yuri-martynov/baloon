module Atrapos.Screens.Game.View exposing (view)

import Mouse
import Svg exposing (..)
import Svg.Attributes exposing (..)
import TouchEvents as Touch exposing (Touch, onTouchEvent)
import Common.ViewBox as ViewBox
import Common.Dict exposing ((@))
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Node.View as Node
import Atrapos.Screens.Game.Link.View as Link
import Atrapos.Screens.Game.UI as UI


view : Model -> Svg Msg
view model =
    case model of
        Loading -> [text_ [] [text "loading"] ]|> svg []
        Loaded model ->
            defs_ :: view_ model 
                |> svg_ model
                |> UI.view model
    


view_ : Model_ -> List (Svg Msg)
view_ ({ nodes, links } as model) =
    (links @ link model) ++ (nodes @ node model)

link : Model_ -> LinkId -> Link -> Svg Msg
link model id link =
    link |> Link.view model |> Svg.map (LinkMsg id)


node : Model_ -> NodeId -> Node -> Svg Msg
node model id node =
    node
        |> Node.view model id
        |> Svg.map (NodeMsg id)


defs_ : Svg msg
defs_ =
    defs [] [ Link.stroke ]

svg_ : Model_ -> List (Svg Msg) -> Svg Msg
svg_ model =
    svg
        [ version "1.1"
        , class "game"
        , ViewBox.init model
        , onTouchEvent Touch.TouchStart (Mouse << (always Down))
        , onTouchEvent Touch.TouchMove (Mouse << Move << ViewBox.location model << position)
        , onTouchEvent Touch.TouchEnd (Mouse << (always Up))
        ] 


position : Touch -> Mouse.Position
position { clientX, clientY } =
    { x = round clientX, y = round clientY }
 