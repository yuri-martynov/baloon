module Atrapos.Levels.Update exposing (update)

import Atrapos.Levels.Model exposing (Model)
import Atrapos.Levels.Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            model ! []
