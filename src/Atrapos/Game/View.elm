module Atrapos.Game.View exposing (view)

import Mouse
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import TouchEvents as Touch exposing (Touch, onTouchEvent)
import Common.ViewBox as ViewBox
import Common.Dict exposing ((@))
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Node.View as Node
import Atrapos.Game.Link.View as Link
import Atrapos.Game.UI as UI


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
    link |> Link.view model 


node : Model_ -> NodeId -> Node -> Svg Msg
node model id node =
    node
        |> Node.view model id
  


defs_ : Svg msg
defs_ =
    defs [] [ Link.stroke ]

svg_ : Model_ -> List (Svg Msg) -> Svg Msg
svg_ ({swipe} as model) =
    let
        location = 
            ViewBox.location model 

        touch event msg =
            onTouchEvent event 
            (Mouse << msg << position )

        down ({x,y} as mouse) =
            if x < 10 then 
                EdgeSwipeStarted mouse
            else 
                mouse |> location |> Down
        
        up ({x,y} as mouse) =
            case swipe of
                Nothing -> 
                    mouse |> location |> Up 

                Just p -> 
                    let k = (toFloat p.y) / (toFloat y) in
                    if (x > p.x && k > 0.8 && k < 1.2 ) then
                        EdgeSwipeEnded Back 
                    else 
                        EdgeSwipeEnded Na
        events_ = 
            [ touch Touch.TouchStart <| down 
            , touch Touch.TouchEnd   <| up 
            , onClick                <| Mouse Click
            ]

        events = 
            if swipe == Nothing then
                (touch Touch.TouchMove  <| Move << location) :: events_
            else
                events_
            
            
    in
        [ version "1.1"
        , class "game"
        , ViewBox.init model
        ] ++ events 
            |> svg


position : Touch -> Mouse.Position
position { clientX, clientY } =
    { x = round clientX, y = round clientY }
 