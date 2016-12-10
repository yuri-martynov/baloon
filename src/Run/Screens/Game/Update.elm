module Run.Screens.Game.Update exposing (updateWindowSize, update)

import Dict
import Window
import Return exposing (mapBoth)
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Msg exposing (..)
import Run.Screens.Game.Objects.Settlement.Update as Settlement
import Run.Screens.Game.Objects.Settlement.Model as Settlement


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize s model =
    { model | windowSize = s } ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ settlements } as model) =
    case msg of
        SettlementMsg id msg ->
            case settlements |> Dict.get id of
                Just settlement ->
                    Settlement.update msg settlement
                        |> mapBoth (SettlementMsg id) (updateSettlement model id)

                Nothing ->
                    model ! []


updateSettlement : Model -> Int -> Settlement.Model -> Model
updateSettlement ({ settlements } as model) id settlement =
    { model | settlements = settlements |> Dict.insert id settlement }
