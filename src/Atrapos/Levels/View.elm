module Atrapos.Levels.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Dict
import Common.List exposing (lst)
import Atrapos.Routes exposing (Route(Level), url)
import Atrapos.Levels.Model exposing (..)
import Atrapos.Levels.Msg exposing (..)


view : Model -> Html Msg
view { levels } =
    [ span [ class "map-header"] [ text "Levels" ]
    , levels
        |> Dict.map level
        |> Dict.values
        |> ul [ class "pure-menu-list" ]
    ]
        |> div [ class "pure-menu" ]


level : LevelId -> LevelTitle -> Html Msg
level id { title } =
    li [ class "pure-menu-item" ]
        [ a
            [ class "pure-menu-link"
            , Level id |> url |> href
            ]
            [ title |> text ]
        ]
