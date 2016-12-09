module Run.Screens.Game.Update exposing (updateWindowSize, update)
import Window
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Msg exposing (..)

updateWindowSize: Window.Size -> Model -> Model
updateWindowSize s model =
    { model | windowSize = s }

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    model ! []
