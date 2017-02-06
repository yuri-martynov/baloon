module Atrapos.Update exposing (update)

import Dict
import Navigation
import Return exposing (mapBoth)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (Msg(..))
import Atrapos.Init exposing (init)
import Atrapos.Levels.Update as Levels
import Atrapos.Game.Update as Game
import Atrapos.Game.Msg as Game
import Atrapos.Data.Levels as Data


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( _, UrlChanged route ) ->
            init route

        ( Game _, GameMsg (Game.Finished id)) ->
            let next = id + 1 in
            if Data.model |> Dict.member next then
                model ! [ Navigation.newUrl <| "#levels/" ++ (toString next) ]
            else
                model ! []

        ( Game model, GameMsg msg ) ->
            Game.update msg model
                |> mapBoth GameMsg Game

        ( Levels model, LevelsMsg msg ) ->
            Levels.update msg model
                |> mapBoth LevelsMsg Levels

        _ ->
            model ! []
