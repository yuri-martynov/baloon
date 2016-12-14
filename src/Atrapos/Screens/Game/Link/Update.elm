module Atrapos.Screens.Game.Link.Update exposing (update, reset, select)

import Atrapos.Screens.Game.Model exposing (Link)
import Atrapos.Screens.Game.Link.Msg exposing (..)


update : Msg -> Link -> ( Link, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            { model | selected = not model.selected } ! []


reset : Link -> Link
reset link =
    { link | selected = False }

select : Link -> Link
select link =
    { link | selected = True }
