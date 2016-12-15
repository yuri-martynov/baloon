module Common.Orientation exposing (Model, orientation, turn)

import Common.Maybe as Maybe

type Model
    = Portrait
    | Landscape

type alias ComparablePoint a comparable =
    { a
        | x: comparable 
        , y: comparable
    }

orientation: List (ComparablePoint a comparable) -> Model
orientation points =
    let
        w =
            points |> List.map .x |> List.maximum |> Maybe.return
            
        h = 
            points |> List.map .y |> List.maximum |> Maybe.return
    in
        if w > h then Landscape else Portrait

turn: (number -> number -> b) -> number -> {a | x: number, y: number} -> b
turn f h {x, y} =
    let 
        x1 = h - y
        y1 = x 
    in
        f x1 y1