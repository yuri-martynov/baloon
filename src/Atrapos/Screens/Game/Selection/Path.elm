module Atrapos.Screens.Game.Selection.Path exposing (selected, len)

import Dict
import Common.Dict as Dict
import Atrapos.Screens.Game.Model exposing (..)


selected : Links -> List LinkId
selected links =
    links
        |> Dict.filter (always .selected)
        |> Dict.keys


len : Links -> List LinkId -> Float
len links path =
    path
        |> List.sort
        |> List.map (.len << (links |> flip Dict.justGet))
        |> List.sum
