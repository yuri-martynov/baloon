module Run.Screens.Game.Objects.Army.Update exposing (update)

import Run.Screens.Game.Objects.Army.Model exposing (..)
import Run.Screens.Game.Objects.Army.Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Grow ->
            ( { model | population = model.population + 1 }, Cmd.none )
