module Atrapos.Screens.Levels.Update exposing (update)

import Atrapos.Screens.Levels.Model exposing (Model)
import Atrapos.Screens.Levels.Msg exposing (Msg(Loaded))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Loaded (Err _) ->
            ( model, Cmd.none )

        Loaded (Ok levels) ->
            { model | levels = levels } ! []

        _ -> Debug.crash "levels update"
