module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, disabled, style)
import Html.Events exposing (..)
import Html.Lazy exposing (lazy)
import Common.List exposing (lst)
import Common.Dict exposing ((#))
import Common.Math as Math
import Common.Types exposing (Location)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)


view : Model_ -> Html Msg -> Html Msg
view ({ victory, minLen, counter } as model) viewGame =
    let
        len =
            counter |> List.head |> Maybe.withDefault 0

        styles =
            case model |> parallax of
                Just { x, y } ->
                    [ style
                        [ ( "background-position-x", (0 + x |> toString) ++ "px" )
                        , ( "background-position-y", (0 - y |> toString) ++ "px" )
                        ]
                    ]

                Nothing ->
                    [ style [ ( "background-position", "0 0" ) ] ]

        classes =
            classList
                [ ( "container", True )
                , ( "begin", True )
                , ( "active", True )
                , ( "victory", victory )
                , ( "overdraft", not victory && len > minLen )
                , ( "incomplete", not victory && len < minLen )
                ]
    in
        div
            [ classes ]
            [ viewGame
            , ui model
            ]


parallax : Model_ -> Maybe Location
parallax { selection, nodes } =
    let
        offset a b =
            let
                l =
                    Math.len a b |> min 3

                r =
                    Math.angle a b
            in
                { x = l * (cos r)
                , y = l * (sin r)
                }
    in
        case selection of
            None ->
                Nothing

            Selection { lastNode, endLocation } ->
                offset (nodes # lastNode) endLocation |> Just

            Deselection { startLocation, endLocation } ->
                offset startLocation endLocation |> Just


ui : Model_ -> Html Msg
ui ({ victory, links, nodes, menu, minLen, counter, counterAnimation, selection } as model) =
    let
        victoryLen =
            round minLen

        progressList =
            counter
                |> List.map (\len -> victoryLen - (round len))

        progressDiv =
            progressList
                |> List.indexedMap (progress counterAnimation)
                |> div [ class "percent" ]
    in
        progressDiv
            :: (selection |> selectionCounter nodes)
            ++ [ button
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


progress : Bool -> Int -> Int -> Html Msg
progress counterAnimation index count =
    count
        |> abs
        |> toString
        |> text
        |> lst
        |> label
            [ classList
                [ ( "percent-" ++ (toString index), True )
                , ( "changing", counterAnimation )
                ]
            ]


selectionCounter : Nodes -> Selection -> List (Html Msg)
selectionCounter nodes selection =
    case selection of
        Selection { lastNode, endLocation } ->
            let
                startLocation =
                    nodes # lastNode

                len =
                    Math.len startLocation endLocation |> round
            in
                if len == 0 then
                    []
                else
                    [ lazy lenDiv len ]

        _ ->
            []


lenDiv : Int -> Html Msg
lenDiv =
    toString
        >> text
        >> lst
        >> label []
        >> lst
        >> div [ class "selection-len" ]


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
