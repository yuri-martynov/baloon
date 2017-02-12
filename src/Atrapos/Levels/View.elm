module Atrapos.Levels.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Dict
import Atrapos.Routes exposing (Route(Level), url)
import Atrapos.Levels.Model exposing (..)
import Atrapos.Levels.Msg exposing (..)
import Atrapos.Data.Model as Level


view : Model -> Html Msg
view { levels, maxLevel } =
    div [ class "home" ]
        [ div [ class "levels-name" ] [ text "PATHFINDER" ]
        , levels
            |> Dict.map (level maxLevel)
            |> Dict.values
            |> ul [ class "levels" ]
        ]


level : Level.Id -> Level.Id -> Level.Model -> Html Msg
level maxLevel id { nodes, links } =
    li
        [ [ ( "level", True )
          , ( "opened", id <= maxLevel )
          , ( "closed", id > maxLevel )
          ]
            |> classList
        ]
        [ a [ Level id |> url |> href ]
            [ id + 1 |> toString |> text ]
        ]
