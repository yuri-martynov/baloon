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
        , onSwipe model
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
            (len |> round |> toString)
                ++ " / "
                ++ (minLen |> round |> toString)

        overdraft =
            len > minLen
    in
        [ label [ class "game-name" ] [ text "PATHFINDER" ]
        , [ text progress ]
            |> label
                [ classList
                    [ ( "percent", True )
                    , ( "victory", victory )
                    , ( "overdraft", overdraft )
                    ]
                ]
        , button
            [ class "hint"
            , onClick Help
            ]
            [ text "HINTS" ]
        , button
            [ classList [("menu", True), ("active", menu)]
            , onClick Menu
            ]
            []
        ] ++ (if menu then [menuPopup] else [])
            |> div
                [ classList
                    [ ( "game-ui", True )
                    , ( "active", True )
                    ]
                ]
menuPopup: Html Msg
menuPopup = 
    div [class "menu-popup"]
        [ button [onClick Reset, class "reset"] [text "reset"]
        , button [onClick EdgeSwipeEnded, class "back"] [text "Back"]
        ]


resetDisabled =
    .links >> Dict.values >> List.any .selected >> not >> disabled


onSwipe { swipe } =
    case swipe of
        Nothing ->
            onRightEdgeSwipeStart EdgeSwipeStarted

        Just start ->
            onRightEdgeSwipeEnd start EdgeSwipeEnded
