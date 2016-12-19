module Atrapos.Main exposing (main)

import Navigation
import Atrapos.Routes as Routes
import Atrapos.Model exposing (Model)
import Atrapos.Msg exposing (Msg(UrlChanged))
import Atrapos.Init exposing (..)
import Atrapos.Update exposing (..)
import Atrapos.View exposing (..) 
import Atrapos.Sub exposing (..) 
 

main : Program Never Model Msg
main =
    Navigation.program (UrlChanged << Routes.parse)
        { init = init << Routes.parse
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
 