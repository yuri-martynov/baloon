module Atrapos.Game.Shared exposing (link, victory, linksLen)

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


-- PRIVATE --------------------

isVictory : Model_ -> Bool
isVictory ({ minLen, nodes, links } as model) =
    let
        len =
            linksLen model
    in
        round (len) == round (minLen)
        &&
        (nodes |> Dict.keys |> List.all (connected links) )

connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.any (\{ node1, node2 } -> node1 == id || node2 == id)