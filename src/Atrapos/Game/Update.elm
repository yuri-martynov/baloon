module Atrapos.Game.Update exposing (update)

import Dict
import Time as Time
import Common.Dict exposing ((#))
import Common.Time as Time
import Return
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Solution as Solution
import Atrapos.Game.Link.Update as Link
import Atrapos.Game.Shared exposing (updateCounter)
import Atrapos.Game.Selection.Update as Selection
import Atrapos.Game.Init exposing (init_)
import Atrapos.Data.Levels as Data


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( Init size, Loading id ) ->
            init_ id size (Data.model # id)

        ( _, Loaded model ) ->
            let
                ( model_, cmd ) =
                    update_ msg model
            in
                ( Loaded model_, cmd )

        _ ->
            Debug.crash "game update not found"


update_ : Msg -> Model_ -> ( Model_, Cmd Msg )
update_ msg ({ nodes, links, menu } as model) =
    case msg of
        WindowSizeChanged size ->
            { model | windowSize = size } ! []

        Menu ->
            { model | menu = not menu } ! []

        Reset ->
            { model
                | links = links |> Dict.map (always Link.reset)
                , victory = False
                , menu = False
            }
                |> updateCounter

        Help ->
            model |> Solution.apply |> updateCounter

        Mouse msg ->
            model
                |> Selection.update msg
                |> checkVictory

        CounterAnimationCompleted ->
            { model | counterAnimation = False } ! []

        _ ->
            model ! []


checkVictory ( { victory } as model, cmd ) =
    if victory then
        model ! [ cmd, model |> nextLevel 1 ]
    else
        ( model, cmd )


nextLevel timeoutSec { levelId } =
    Finished levelId
        |> Time.delay (timeoutSec * Time.second)
