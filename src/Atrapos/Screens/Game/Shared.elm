module Atrapos.Screens.Game.Shared exposing (link, victory)

import Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Selection.Path as Selection


link : Model -> LinkId -> Link -> Model
link ({ links } as model) id link =
    { model | links = links |> Dict.insert id link }
        |> victory


victory : Model -> Model
victory model =
    { model | victory = isVictory model }


isVictory : Model -> Bool
isVictory { links, minLen } =
    let
        selected =
            links
                |> Dict.filter (always .selected)
                |> Dict.keys

        len =
            selected
                |> Selection.len links
    in
        len == minLen
