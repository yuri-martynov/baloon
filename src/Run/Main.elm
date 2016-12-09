module Run.Main exposing (main)

import Html
import Run.Init exposing (..)
import Run.Update exposing (..)
import Run.View exposing (..)
import Run.Sub exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
