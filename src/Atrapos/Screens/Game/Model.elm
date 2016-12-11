module Atrapos.Screens.Game.Model exposing (..)

import Dict exposing (Dict)
import Common.ViewBox as ViewBox
import Atrapos.Screens.Game.Objects.Node.Model as Node


type alias Model =
    ViewBox.Model_
        { nodes : Dict NodeId Node.Model
        }


type alias NodeId =
    Int


type alias LinkId =
    Int
