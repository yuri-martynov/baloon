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
import Atrapos.Data.Model as Level
import Atrapos.Routes exposing (Route(Level), url)
import Atrapos.Port as Port


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( model, msg ) of
        ( _, UrlChanged route ) ->
            init 0 route

        ( Game _, GameMsg (Game.Finished id) ) ->
            model |> levelCompleted id

        ( Game model, GameMsg msg ) ->
            Game.update msg model
                |> mapBoth GameMsg Game

        ( Levels model, LevelsMsg msg ) ->
            Levels.update msg model
                |> mapBoth LevelsMsg Levels

        _ ->
            model ! []


levelCompleted : Level.Id -> Model -> ( Model, Cmd Msg )
levelCompleted id model =
    let
        next =
            id + 1

        save =
            { key = "maxLevel", level = next }
                |> Port.setMaxLevel

        navigate =
            if Data.model |> Dict.member next then
                [ Level next |> url |> Navigation.newUrl ]
            else
                []
    in
        model ! (save :: navigate)
