module Ballon.View exposing (view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Ballon.Model exposing (..)
import Ballon.Msg exposing (Msg)
import Common.ViewBox exposing (svg_)


view : Model -> Svg Msg
view model =
    case model.windowSize of
        Just _ ->
            view_ model |> svg_

        Nothing ->
            svg [] []


view_ : Model -> List (Svg Msg)
view_ { state } =
    case state of
        Na ->
            []

        Blowing model ->
            viewBlowing model

        Flying model ->
            viewFlying model


viewBlowing : BlowingModel -> List (Svg Msg)
viewBlowing { radius, x, y } =
    [ circle
        [ x |> toString |> cx
        , y |> toString |> cy
        , radius |> toString |> r
        , fill "red"
        ]
        []
    ]


viewFlying : FlyingModel -> List (Svg Msg)
viewFlying { radius, x, y } =
    [ circle
        [ x |> toString |> cx
        , y |> toString |> cy
        , radius |> toString |> r
        , fill "red"
        ]
        []
    ]
