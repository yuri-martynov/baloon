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
    div [ class "home"]
        [ div [class "levels-name"] [text "PATHFINDER"]
        , levels
            |> Dict.map level
            |> Dict.values
            |> ul [ class "levels" ]
        ]
        


level : Level.Id -> Level.Model -> Html Msg
level id { nodes, links } =
    li [ class "level" ]
        [ a [ Level id |> url |> href ]
            [ id + 1 |> toString |> text ]
        ]
