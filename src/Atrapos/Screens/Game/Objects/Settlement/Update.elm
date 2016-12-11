module Atrapos.Screens.Game.Objects.Settlement.Update exposing (update)

import Atrapos.Screens.Game.Objects.Settlement.Model exposing (..)
import Atrapos.Screens.Game.Objects.Settlement.Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Grow ->
            ( { model | population = model.population + 1 }, Cmd.none )

        _ ->
            ( model, Cmd.none )
