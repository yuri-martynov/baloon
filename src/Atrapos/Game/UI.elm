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
        , onClick (Mouse Click)
        , onSwipe model
        ]
        [ viewGame
        , ui model
        ]


ui : Model_ -> Html Msg
ui ({ victory, links, menu } as model) =
    [ 
      
    label [ victoryClass model ] [ model |> Game.progress |> toString |> text ]
    , label [ class "game-name"] [text "PATHFINDER"]
    , button
        [ class "hint"
        , onClick Help
        ]
        [ text "HINTS" ]
    , button
        [ class "menu"
        --, onClick Help
        ] 
        [ ]
    ]
        |> div
            [ classList
                [ ( "game-ui", True )
                , ( "active", True )
                ]
            ]


resetDisabled =
    .links >> Dict.values >> List.any .selected >> not >> disabled


victoryClass { victory } =
    (if victory then
        "victory percent"
     else
        "percent"
    )
        |> class


onSwipe { swipe } =
    case swipe of
        Nothing ->
            onRightEdgeSwipeStart EdgeSwipeStarted

        Just start ->
            onRightEdgeSwipeEnd start EdgeSwipeEnded
