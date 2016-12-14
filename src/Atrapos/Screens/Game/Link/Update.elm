module Atrapos.Screens.Game.Link.Update exposing (update, reset, select, toggle)

import Atrapos.Screens.Game.Model exposing (Link)
import Atrapos.Screens.Game.Link.Msg exposing (..)


update : Msg -> Link -> ( Link, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            toggle model ! []


reset : Link -> Link
reset link =
    { link | selected = False }


select : Link -> Link
select link =
    { link | selected = True }


toggle : Link -> Link
toggle link =
    { link | selected = not link.selected } 
