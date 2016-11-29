module Ballon.View exposing (view)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Ballon.Model exposing (..)
import Ballon.Msg exposing (Msg)


view : Model -> Svg Msg
view =
    view' >> svg'


view' : Model -> List (Svg Msg)
view' { state } =
    case state of
        Na ->
            []

        Blowing model ->
            viewBlowing model

        Flying model ->
            viewFlying model


viewBlowing : BlowingModel -> List (Svg Msg)
viewBlowing { radius } =
    [ circle
        [ cx "150"
        , cy "150"
        , radius |> toString |> r
        , fill "red"
        ]
        []
    ]


viewFlying : FlyingModel -> List (Svg Msg)
viewFlying { radius, y } =
    [ circle
        [ cx "150"
        , y |> toString |> cy
        , radius |> toString |> r
        , fill "red"
        ]
        []
    ]


svg' =
    svg
        [ version "1.1"
        , viewBox "0 0 1024 768" 
        ]
