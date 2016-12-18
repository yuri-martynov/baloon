module Atrapos.Screens.Game.Orientation exposing (update)

import Dict
import Common.Maybe as Maybe
import Common.Orientation as Orientation
import Atrapos.Screens.Game.Model exposing (..)

update: Model -> Model
update ({windowSize, nodes, nodesTurned }as model) =
    let
        windowOrientation = [{x = windowSize.width, y = windowSize.height}] |> Orientation.orientation
        modelOrientation = nodes |> Dict.values |> Orientation.orientation
    in
        if windowOrientation == modelOrientation then model
        else
            case nodesTurned of
                Just nodes_ ->
                    {model | nodesTurned = Just nodes, nodes = nodes_}
                Nothing ->
                    let 
                        h = nodes |> Dict.values |> List.map .y |> List.maximum |> Maybe.return |> (+) 2
                    in
                        {model 
                            | nodes = nodes |> Dict.map (\_ p -> Orientation.turn (\x y -> {x = x , y = y}) h p )
                            , nodesTurned = Just nodes
                        }