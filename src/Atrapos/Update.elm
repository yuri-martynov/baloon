module Atrapos.Update exposing (update)

import Window
import Return exposing (mapBoth)
import Atrapos.Model exposing (Model(..))
import Atrapos.Msg exposing (Msg(..))
import Atrapos.Screens.Levels.Update as Levels
import Atrapos.Screens.Levels.Init as Levels
import Atrapos.Screens.Levels.Msg as Levels
import Atrapos.Screens.Game.Update as Game
import Atrapos.Screens.Game.Init as Game


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowSizeChanged size ->
            updateWindowSize size model

        _ ->
            update0 msg model


update0 : Msg -> Model -> ( Model, Cmd Msg )
update0 msg model =
    case ( model, msg ) of
        ( Game model, GameMsg msg ) ->
            Game.update msg model
                |> mapBoth GameMsg Game

        ( Levels {windowSize}, LevelsMsg (Levels.Play level) ) ->
            Game.init windowSize
                |> mapBoth GameMsg Game

        ( Levels model, LevelsMsg msg ) ->
            Levels.update msg model
                |> mapBoth LevelsMsg Levels

        _ ->
            model ! []


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize size model =
    case model of
        Splash ->
            Levels.init size
                |> mapBoth LevelsMsg Levels

        Game game ->
            Game.updateWindowSize size game
                |> mapBoth GameMsg Game

        _ ->
            model ! []
