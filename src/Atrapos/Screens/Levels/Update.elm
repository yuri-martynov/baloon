module Atrapos.Screens.Levels.Update exposing (update)

import Atrapos.Screens.Levels.Model exposing (Model)
import Atrapos.Screens.Levels.Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LevelListLoaded (Err _) ->
            ( model, Cmd.none )

        LevelListLoaded (Ok levels) ->
            { model | levels = levels } ! []
