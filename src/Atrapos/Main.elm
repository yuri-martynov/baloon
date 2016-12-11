module Atrapos.Main exposing (main)

import Html
import Atrapos.Init exposing (..)
import Atrapos.Update exposing (..)
import Atrapos.View exposing (..)
import Atrapos.Sub exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
