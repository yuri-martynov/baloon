module Run.Screens.Game.Update exposing (updateWindowSize, update)

import Dict
import Window
import Return exposing (mapBoth)
import Run.Screens.Game.Model exposing (Model)
import Run.Screens.Game.Msg exposing (..)
import Run.Screens.Game.Objects.Settlement as Settlement


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
                        |> mapBoth (SettlementMsg id) (updateSettlements model id)

                Nothing ->
                    model ! []


updateSettlements : Model -> Int -> Settlement.Model -> Model
updateSettlements ({ settlements } as model) id settlement =
    { model | settlements = settlements |> Dict.insert id settlement }
