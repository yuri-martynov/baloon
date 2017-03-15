module Atrapos.Init exposing (init)

import Return exposing (mapBoth)
import Atrapos.Routes as R exposing (Route, navigateTo)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (..)
import Atrapos.Levels.Init as Levels
import Atrapos.Game.Init as Game
import Atrapos.Data.Model as Data


init : Data.Id -> Route -> ( Model, Cmd Msg )
init level route =
    case route of
        R.NotFound ->
            ( NotFound, R.Level level |> navigateTo )

        R.Levels ->
            Levels.init
                |> mapBoth LevelsMsg Levels

        R.Level id ->
            Game.init id
                |> mapBoth GameMsg Game
