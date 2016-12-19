module Atrapos.Screens.Game.Shared exposing (link, victory, progress)

import Dict
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Selection.Path as Selection


link : Model_ -> LinkId -> Link -> Model_
link ({ links } as model) id link =
    { model | links = links |> Dict.insert id link }
        |> victory


victory : Model_ -> Model_
victory model =
    { model | victory = isVictory model }


progress : Model_ -> Float
progress { links, minLen } =
    let
        len =
            links
                |> Selection.selected
                |> Selection.len links
    in
        len / minLen


isVictory : Model_ -> Bool
isVictory model =
    let
        p = progress model 
    in
        p > 0.9999 && p < 1.0001
