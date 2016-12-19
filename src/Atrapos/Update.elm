module Atrapos.Update exposing (update)

import Return exposing (mapBoth)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (Msg(..))
import Atrapos.Init exposing (init)
import Atrapos.Screens.Levels.Update as Levels
import Atrapos.Screens.Game.Update as Game


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        (_, UrlChanged route) -> 
            init route

        ( Game model, GameMsg msg ) ->
            Game.update msg model
                |> mapBoth GameMsg Game

        ( Levels model, LevelsMsg msg ) ->
            Levels.update msg model
                |> mapBoth LevelsMsg Levels

        _ ->
            model ! []
