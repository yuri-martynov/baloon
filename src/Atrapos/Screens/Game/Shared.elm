module Atrapos.Screens.Game.Shared exposing (link, victory)

import Dict
import Atrapos.Screens.Game.Model exposing (..)


link : Model -> LinkId -> Link -> Model
link ({ links } as model) id link =
    { model | links = links |> Dict.insert id link }
        |> victory


victory : Model -> Model
victory model =
    { model | victory = isVictory model }


isVictory : Model -> Bool
isVictory { links, solution } =
    let
        selected =
            links
                |> Dict.filter (always .selected)
                |> Dict.keys
                |> List.sort
    in
        selected == solution
