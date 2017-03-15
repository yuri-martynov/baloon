module Atrapos.Main exposing (main)

import Navigation
import Atrapos.Routes as Routes
import Atrapos.Model exposing (Model)
import Atrapos.Msg exposing (Msg(UrlChanged))
import Atrapos.Init exposing (..)
import Atrapos.Update exposing (..)
import Atrapos.View exposing (..)
import Atrapos.Sub exposing (..)
import Atrapos.Data.Model as Data


main : Program Data.Id Model Msg
main =
    Navigation.programWithFlags (UrlChanged << Routes.parse)
        { init = (\f -> (init f) << Routes.parse)
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
