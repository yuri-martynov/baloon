module Atrapos.Init exposing (init)

import Return exposing (mapBoth)
import Atrapos.Routes as R exposing (Route, navigateTo)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (..)
import Atrapos.Screens.Levels.Init as Levels
import Atrapos.Screens.Game.Init as Game 

init : Route -> ( Model, Cmd Msg )
init route =
    case route of
        R.NotFound -> 
            (NotFound, navigateTo R.Levels)

        R.Levels -> 
            Levels.init 
            |> mapBoth LevelsMsg Levels

        R.Level id ->
            Game.init id
            |> mapBoth GameMsg Game