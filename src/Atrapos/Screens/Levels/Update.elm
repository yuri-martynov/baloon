module Atrapos.Screens.Levels.Update exposing (update)

import Atrapos.Screens.Levels.Model exposing (Model)
import Atrapos.Screens.Levels.Msg exposing (..)
import Atrapos.Screens.Levels.Cmd exposing (loadLevel)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LevelListLoaded (Err _) ->
            ( model, Cmd.none )

        LevelListLoaded (Ok levels) ->
            { model | levels = levels } ! []

        Play id ->
            model ! [ loadLevel id ]

        LevelLoaded (Err _) ->
            ( model, Cmd.none )

        _ ->
            Debug.crash "levels update"
