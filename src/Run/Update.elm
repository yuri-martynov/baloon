module Run.Update exposing (update)

import Window
import Return exposing (mapBoth)
import Run.Model exposing (Model(..))
import Run.Msg exposing (Msg(..))
import Run.Screens.Game.Update as Game
import Run.Screens.Game.Init as GameInit


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

        _ ->
            model ! []


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize size model =
    case model of
        Splash ->
            GameInit.init size
                |> mapBoth GameMsg Game


        Game game ->
            Game.updateWindowSize size game
                |> mapBoth GameMsg Game
