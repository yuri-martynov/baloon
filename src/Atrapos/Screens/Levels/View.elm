module Atrapos.Screens.Levels.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict
import Atrapos.Screens.Levels.Model exposing (..)
import Atrapos.Screens.Levels.Msg exposing (..)


view : Model -> Html Msg
view { levels } =
    levels
        |> Dict.map level
        |> Dict.values
        |> div []


level : LevelId -> Level -> Html Msg
level title { nodes, links } =
    div []
        [ title |> text
        , "nodes " |> text
        , nodes |> List.length |> toString |> text
        , ", links " |> text
        , links |> List.length |> toString |> text
        , button [onClick <| Play title ] [text "Play"]
        ]
