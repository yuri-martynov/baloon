module Atrapos.Screens.Game.Shared exposing (link, victory, progress)

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


progress : Model -> Float
progress { links, minLen } =
    let
        len =
            links
                |> Selection.selected
                |> Selection.len links
    in
        len / minLen


isVictory : Model -> Bool
isVictory model =
    let
        p = progress model 
    in
        p > 0.9999 && p < 1.0001
