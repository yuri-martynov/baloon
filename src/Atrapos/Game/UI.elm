module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (class, classList, href, disabled, style, attribute)
import Html.Events exposing (..)
import Common.List exposing (lst)
import Atrapos.Routes exposing (Route(Level), url)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)


view : Model_ -> Html Msg -> Html Msg
view ({ victory, minLen, counter } as model) viewGame =
    let
        classes =
            classList
                [ ( "container", True )
                , ( "begin", True )
                , ( "active", True )
                , ( "victory", victory )
                , ( "overdraft", not victory && counter > minLen )
                , ( "incomplete", not victory && counter < minLen )
                ]
    in
        [ viewGame, progress model, ui model ]
            |> div [ classes ]


ui : Model_ -> Html Msg
ui ({ menu, victory } as model) =
    button [ class "menu", onClick Menu ] []
        :: (menu_ menu ++ levelCompleted model)
        |> div
            [ class "game-ui" ]


menu_ : Bool -> List (Html Msg)
menu_ menu =
    if menu then
        [ menuPopup ]
    else
        []


levelCompleted : Model_ -> List (Html Msg)
levelCompleted { victory, levelId } =
    if victory then
        [ text "Victory" 
        , button [ Finished levelId |> onClick ] [ text "Next level"]
        ] 
            |> div [ class "level-completed" ] |> lst
    else
        []


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


progress : Model_ -> Html Msg
progress { counter, minLen } =
    let
        w =
            (1 - counter / minLen)
                / 2
                * 100
                |> Basics.abs
                |> Basics.min 100
                |> toString
                |> (flip (++) "%;")
    in
        [ progressLine w "line"
        , progressLine w "line right"
        ]
            |> div [ class "progress" ]


progressLine : String -> String -> Html msg
progressLine w class_ =
    div
        [ class class_
        , attribute "style" <| "width:" ++ w
        ]
        []
