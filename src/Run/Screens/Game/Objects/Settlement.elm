module Run.Screens.Game.Objects.Settlement exposing (Model, Msg, update, subscriptions, view)

import Time exposing (second)
import Svg exposing (Svg, svg, circle, g)
import Svg.Attributes exposing (..)
import Common.Types exposing (..)


type alias Model =
    Location_
        { player : Player
        , population : Int
        }


type alias Player =
    Int


type Msg
    = Grow


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Grow ->
            ( { model | population = model.population + 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second (always Grow)


view : Model -> Svg msg
view { player, x, y, population } =
    circle
        [ x |> toString |> cx
        , y |> toString |> cy
        , population |> toString |> r
        , player |> playerColor |> fill
        ]
        []


playerColor player =
    case player of
        0 ->
            "red"

        1 ->
            "blue"

        _ ->
            "black"
