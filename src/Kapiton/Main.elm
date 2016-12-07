module Kapiton.Main exposing (main)

import Html exposing (program)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Time exposing (Time, second, inSeconds)
import Task exposing (..)
import AnimationFrame


type alias Model =
    { x : Float
    , y : Float
    , dropped : Maybe Time
    , victory : Maybe Player
    }


type Player
    = Old
    | Young


type Msg
    = NoOp
    | Step Time
    | Drop
    | DropTime Time



--messages = [NoOp, Drop, Step 2.0]


y0 =
    100.0


g =
    9.7


init : ( Model, Cmd Msg )
init =
    ( Model 50.0 y0 Nothing Nothing, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Step t ->
            { model
                | x = model.x + 1.0
                , y = updateY model t
                , victory = updateVictory model
            }
                ! []

        Drop ->
            model ! [ Time.now |> Task.perform DropTime ]

        DropTime time ->
            { model | dropped = Just time } ! []

        NoOp ->
            model ! []


updateY : Model -> Time -> Float
updateY { dropped, y } t1 =
    case dropped of
        Nothing ->
            y

        Just t0 ->
            y0 + g * (((t1 - t0) / 100.0) ^ 2) / 2


updateVictory : Model -> Maybe Player
updateVictory model =
    if model.x > 250.0 then
        Just Old
    else if model.x > 150.0 && model.x < 250.0 && model.y > 200.0 && model.y < 400 then
        Just Young
    else
        Nothing


view : Model -> Svg Msg
view model =
    svg
        [ width "300"
        , height "300"
        ]
        [ circle
            [ cx (toString model.x)
            , cy "300"
            , r "50"
            , fill "blue"
            ]
            []
        , circle
            [ cx "200"
            , model.y |> toString |> cy
            , r "50"
            , fill "red"
            , onClick Drop
            ]
            []
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.victory == Nothing then
        AnimationFrame.times Step
    else
        Sub.none


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
