module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Common.List exposing (lst)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Shared as Game


view : Model_ -> Html Msg -> Html Msg
view ( {victory, minLen} as model) viewGame =
    let
        len =
            model |> Game.linksLen
    in
        div
            [ classList 
                [ ("container", True) 
                , ( "active", True )
                , ( "victory", victory )
                , ( "overdraft", not victory && len > minLen )
                , ( "incomplete", not victory && len < minLen )
                ]
            ]
            [ viewGame
            , ui model
            ]


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
                    [ menuPopup ]
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
        , a [ class "back", href "#levels" ] [ text "Menu map" ]
        , label [ onClick Menu, class "close" ] [ text "Continue" ]
        ]


resetDisabled =
    .links >> Dict.values >> List.any .selected >> not >> disabled
