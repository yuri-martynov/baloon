module Run.Update exposing (update)

import Window
import Run.Model exposing (Model, Screen(..))
import Run.Msg exposing (Msg(..))
import Run.Screens.Game.Update as Game
import Run.Screens.Game.Init as GameInit


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowSizeChanged s ->
            updateWindowSize s model

        _ ->
            let
                ( screen, cmd ) =
                    updateScreen msg model.screen
            in
                ( { model | screen = screen }, cmd )


updateScreen : Msg -> Screen -> ( Screen, Cmd Msg )
updateScreen msg screen =
    case ( screen, msg ) of
        ( Game model, GameMsg msg ) ->
            let
                ( model_, cmd ) =
                    Game.update msg model
            in
                Game model_ ! [ cmd |> Cmd.map GameMsg ]

        _ ->
            screen ! []


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize s model =
    case model.screen of
        Splash ->
            updateSplashWindowSize s model

        Game game ->
            { model | screen = Game.updateWindowSize s game |> Game } ! []


updateSplashWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateSplashWindowSize s model =
    { model
        | screen =
            Game (GameInit.init s)
    }
        ! []
