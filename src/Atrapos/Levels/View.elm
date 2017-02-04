module Atrapos.Levels.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Dict
import Atrapos.Routes exposing (Route(Level), url)
import Atrapos.Levels.Model exposing (..)
import Atrapos.Levels.Msg exposing (..)
import Atrapos.Data.Model as Level


view : Model -> Html Msg
view { levels } =
    [ span [ class "map-header" ] [ text "Levels" ]
    , levels
        |> Dict.map level
        |> Dict.values
        |> ul [ class "pure-menu-list" ]
    ]
        |> div [ class "pure-menu" ]


level : Level.Id -> Level.Model -> Html Msg
level id { nodes, links } =
    li [ class "pure-menu-item" ]
        [ a
            [ class "pure-menu-link"
            , Level id |> url |> href
            ]
            [ id + 1 |> toString |> text
            , " (" |> text
            , nodes |> List.length |> toString |> text
            , "/" |> text
            , links |> List.length |> toString |> text
            , ")" |> text
            ]
        ]
