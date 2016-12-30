module Atrapos.Game.Link.Update exposing (reset, select, toggle)

import Atrapos.Game.Model exposing (Link)


reset : Link -> Link
reset link =
    { link | selected = False }


select : Link -> Link
select link =
    { link | selected = True }


toggle : Link -> Link
toggle link =
    { link | selected = not link.selected } 
