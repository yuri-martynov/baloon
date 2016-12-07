module Common.ViewBox exposing (svg_, fromMouse)

import Common.Types exposing (..)
import Window
import Mouse
import Svg.Attributes exposing (version, viewBox)
import Svg exposing (Svg, svg)


svg_ : List (Svg msg) -> Svg msg
svg_ =
    let
        { w, h } =
            size

        fold_ a b =
            b ++ (toString a) ++ " "

        viewBox_ =
            [ 0.0, 0.0, w, h ]
                |> List.foldl fold_ ""
    in
        svg [ version "1.1", viewBox viewBox_ ]


size : Size
size =
    let
        iPhone6 =
            { w = 1920.0, h = 1080.0 }

        aspectRation =
            iPhone6.h / iPhone6.w

        w =
            1000.0

        h =
            w * aspectRation
    in
        { w = w, h = h }


fromMouse : Window.Size -> Mouse.Position -> Location
fromMouse { width, height } { x, y } =
    let
        { w, h } =
            size
    in
        { x = (toFloat x) * (w / (toFloat width)), y = (toFloat y) * (h / (toFloat height)) }
