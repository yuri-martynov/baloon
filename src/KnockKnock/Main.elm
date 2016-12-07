module KnockKnock.Main exposing (main)

import String exposing (toLower)
import Dict exposing (Dict)
import Array exposing (Array)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Common.Types exposing (Location_)
import Html.App as App
import Time exposing (Time, second)
import Common.ViewBox exposing (svg_)


type alias Model =
    { map : Dict Int Dot
    }


type alias Dot =
    Location_
        { color : Color
        , new : Bool
        }


type Color
    = Red
    | Green
    | Purple
    | Black
    | Yellow


colors =
    [ Red, Green, Purple, Black, Yellow ] |> Array.fromList


type Msg
    = NoOp
    | Click Int
    | NewDot Time


init : ( Model, Cmd Msg )
init =
    { map =
        [ { x = 100, y = 100, color = Red, new = False }
        , { x = 150, y = 100, color = Green, new = False }
        , { x = 200, y = 200, color = Purple, new = False }
        , { x = 300, y = 250, color = Yellow, new = False }
        , { x = 250, y = 300, color = Black, new = False }
        ]
            |> List.indexedMap (,)
            |> Dict.fromList
    }
        ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click id ->
            { model | map = model.map |> Dict.remove id } ! []

        NewDot time ->
            let
                x =
                    round time
            in
                { model
                    | map =
                        model.map
                            |> Dict.map (\_ d -> { d | new = False })
                            |> Dict.insert x
                                { x = toFloat (x % 200)
                                , y = toFloat (x % 150)
                                , color = getColor x
                                , new = True
                                }
                }
                    ! []

        _ ->
            ( model, Cmd.none )


getColor x =
    case colors |> Array.get (x % (colors |> Array.length)) of
        Just color ->
            color

        Nothing ->
            Debug.crash "impossible))))"


view : Model -> Svg Msg
view model =
    model.map
        |> Dict.toList
        |> List.map viewDot
        |> svg_


viewDot : ( Int, Dot ) -> Svg Msg
viewDot ( id, { x, y, color, new } ) =
    circle
        [ x |> toString |> cx
        , y |> toString |> cy
        , r "50"
        , color |> toString |> toLower |> fill
        , onClick (Click id)
        , (if new then
            "hidden"
           else
            "show"
          )
            |> class
        ]
        []


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (second * 3.33) NewDot


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
