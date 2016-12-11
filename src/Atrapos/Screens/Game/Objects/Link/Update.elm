module Atrapos.Screens.Game.Objects.Link.Update exposing (update)

import Atrapos.Screens.Game.Model exposing (Link)
import Atrapos.Screens.Game.Objects.Link.Msg exposing (..)


update : Msg -> Link -> (Link, Cmd Msg)
update msg model =
    case msg of
        Toggle ->
            { model | selected = not model.selected } ! []
