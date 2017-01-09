module Atrapos.Game.Shared exposing (link, victory, progress, linksLen)

import Dict
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Selection.Path as Selection


link : Model_ -> LinkId -> Link -> Model_
link ({ links } as model) id link =
    { model | links = links |> Dict.insert id link }
        |> victory


victory : Model_ -> Model_
victory model =
    { model | victory = isVictory model }


linksLen : Model_ -> Float
linksLen { links } =
    links
        |> Selection.selected
        |> Selection.len links


progress : Model_ -> Float
progress ({ minLen } as model) =
    (linksLen model) / minLen


isVictory : Model_ -> Bool
isVictory model =
    let
        p =
            progress model
    in
        p > 0.9999 && p < 1.0001
