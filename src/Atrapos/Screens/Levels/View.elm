module Atrapos.Screens.Levels.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Dict
import Atrapos.Routes exposing (Route(Level), url)
import Atrapos.Screens.Levels.Model exposing (..)
import Atrapos.Screens.Levels.Msg exposing (..)


view : Model -> Html Msg
view { levels } = 
    levels
        |> Dict.map level
        |> Dict.values
        |> ul []


level : LevelId -> LevelTitle -> Html Msg
level id { title } =
    li []
        [ a [ Level id |> url |> href ] [title |> text] ]
