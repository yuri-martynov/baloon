module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, disabled, style)
import Html.Events exposing (..)
import Common.List exposing (lst)
import Common.Dict exposing ((#))
import Common.Math as Math
import Common.Types exposing (Location)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Shared as Game


view : Model_ -> Html Msg -> Html Msg
view ({ victory, minLen, counter } as model) viewGame =
    let
        len =
            counter |> List.head |> Maybe.withDefault 0

        styles =
            case model |> parallax of
                Just { x, y } ->
                    [ style
                        [ ( "background-position-x", (-25 + x |> toString) ++ "px" )
                        , ( "background-position-y", (-25 - y |> toString) ++ "px" )
                        ]
                    ]

                Nothing ->
                    [ style [ ( "background-position", "-25px -25px" ) ] ]

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
            ( classes :: styles )
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
ui ({ victory, links, menu, minLen, counter } as model) =
    let
        victoryLen = 
             round minLen

        progressList =
            counter
                |> List.map (\len -> victoryLen - (round len))

    in
        (progressList |> List.indexedMap progress)
        ++
        [ button
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

progress: Int -> Int -> Html Msg
progress index count =
    count
        |> abs
        |> toString
        |> text
        |> lst
        |> label
            [ classList
                [ ( "percent", True ) 
                , ( "percent-" ++ (toString index), True)
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
