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


level : LevelId -> LevelTitle -> Html Msg
level id { title } =
    div []
        [ title |> text
        , button [onClick <| Play id ] [text "Play"]
        ]
