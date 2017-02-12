module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (style, class, src, classList, href, disabled)
import Html.Events exposing (..)
import Common.List exposing (lst)
import Common.Dict exposing ((#))
import Common.Math as Math
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Shared as Game


view : Model_ -> Html Msg -> Html Msg
view ({ victory, minLen } as model) viewGame =
    let
        len =
            model |> Game.linksLen
    in
        div
            [ classList
                [ ( "container", True )
                , ( "begin", True )
                , ( "active", True )
                , ( "victory", victory )
                , ( "overdraft", not victory && len > minLen )
                , ( "incomplete", not victory && len < minLen )
                ]
            ]
            [ background model
            , viewGame
            , ui model
            ]


background {selection, nodes} =
    let
        style_ = 
            case selection of
                None -> []
                Selection {lastNode, endLocation} ->
                    offset (nodes # lastNode) endLocation 
                Deselection {startLocation, endLocation} ->
                    offset startLocation endLocation 
        
        offset a b =
            let 
                l = Math.len a b |> min 2
                r = Math.angle a b
            in
                [ ("left", l * (cos r) |> toString)
                , ("top", l * (sin r) |> toString)
                ]


    in
        img 
            [ class "background"
            , src "BG-2.PNG" 
            , style style_
            ] []

ui : Model_ -> Html Msg
ui ({ victory, links, menu, minLen } as model) =
    let
        len =
            model |> Game.linksLen

        progress =
            (minLen |> round)
                - (len |> round)
    in
        [ progress
            |> abs
            |> toString
            |> text
            |> lst
            |> label
                [ classList
                    [ ( "percent", True ) ]
                ]
        , button
            [ class "hint"
            , onClick Help
            ]
            [ text "HINTS" ]
        , button
            [ classList [ ( "menu", True ), ( "active", menu ) ]
            , onClick Menu
            ]
            []
        ]
            ++ (if menu then
                    [ menuPopup  ]
                else
                    []
               )
            |> div
                [ classList
                    [ ( "game-ui", True )
                    ]
                ]


menuPopup : Html Msg
menuPopup =
    div [ class "menu-popup" ]
        [ label [ onClick Menu, class "name" ] [ text "PATHFINDER" ]
        , label [ onClick Reset, class "reset" ] [ text "Restart Level" ]
        , a [ class "back", href "#levels" ] [ text "Missions" ]
        , label [ onClick Menu, class "close" ] [ text "Continue" ]
        ]


resetDisabled =
    .links >> Dict.values >> List.any .selected >> not >> disabled
