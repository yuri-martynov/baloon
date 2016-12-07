module Ballon.Main exposing (main)

import Html.App as App
import Ballon.Init exposing (..)
import Ballon.View exposing (..)
import Ballon.Update exposing (..)
import Ballon.Init exposing (..)
import Ballon.Sub exposing (..)


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
