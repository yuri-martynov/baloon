module Atrapos.Game.Update exposing (update)

import Dict
import Common.Dict exposing ((#))
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Solution as Solution
import Atrapos.Game.Link.Update as Link
import Atrapos.Game.Shared exposing (link, victory)
import Atrapos.Game.Selection.Update as Selection
import Atrapos.Game.Init exposing (init_)
import Atrapos.Data.Levels as Data


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( Init size, Loading id ) ->
            init_ size (Data.model # id)

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
        Menu ->
            { model | menu = not menu } ! []

        Reset ->
            { model
                | links = links |> Dict.map (always Link.reset)
                , victory = False
                , menu = False
            }
                ! []

        Help ->
            (model |> Solution.apply |> victory) ! []

        Mouse msg ->
            selection msg model

        _ ->
            model ! []


selection msg model =
    ( Selection.update msg model |> victory, Cmd.none )
