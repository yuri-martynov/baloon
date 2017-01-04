module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Common.Events exposing (onRightEdgeSwipeStart, onRightEdgeSwipeEnd)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Shared as Game


view : Model_ -> Html Msg -> Html Msg
view model viewGame =
    div
        [ class "container"
        , onDoubleClick (Mouse Click)
        , onSwipe model
        ]
        [ viewGame
        , ui model
        ]


ui : Model_ -> Html Msg
ui ({ victory, links, menu } as model) =
    [ a
        [ class "pure-button"
        , href "#levels"
        ]
        [ text "back" ]
    , button
        [ class "pure-button"
        , onClick Reset
        , resetDisabled model
        ]
        [ text "reset" ]
    , button
        [ class "pure-button"
        , onClick Help
        ]
        [ text "Help" ]
    , label [ victoryClass model ] [ model |> Game.progress |> toString |> text ]
    ]
        |> div
            [ classList
                [ ( "game-ui", True )
                , ( "active", menu )
                ]
            ]


resetDisabled =
    .links >> Dict.values >> List.any .selected >> not >> disabled


victoryClass { victory } =
    (if victory then
        "victory"
     else
        ""
    )
        |> class


onSwipe { swipe } =
    case swipe of
        Nothing ->
            onRightEdgeSwipeStart EdgeSwipeStarted

        Just start ->
            onRightEdgeSwipeEnd start EdgeSwipeEnded
