module Atrapos.Screens.Game.Selection.Path exposing (len)

import Common.Dict as Dict
import Atrapos.Screens.Game.Model exposing (..)


len : Links -> Solution -> Float
len links solution =
    solution
        |> List.map (.len << (links |> flip Dict.justGet))
        |> List.sum
