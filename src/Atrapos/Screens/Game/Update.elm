module Atrapos.Screens.Game.Update exposing (updateWindowSize, update)

import Dict
import Window
import Return exposing (mapBoth)
import Common.Dict exposing ((#))
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Link.Update as Link


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize s model =
    { model | windowSize = s } ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ nodes, links } as model) =
    case msg of
        LinkMsg id msg ->
            links # id
                |> Link.update msg
                |> mapBoth (LinkMsg id) (link model id)

        _ ->
            model ! []


link : Model -> LinkId -> Link -> Model
link ({ links } as model) id link =
    { model | links = links |> Dict.insert id link }



-- startAttack : Model -> ( Model, Cmd Msg )
-- startAttack ({ attack, nodes } as model) =
--     case attack of
--         AttackFromTo from _ ->
--             let
--                 settlementFrom =
--                     nodes |> Dict.justGet from
--                 settlementFrom_ =
--                     { settlementFrom | population = settlementFrom.population // 3 }
--             in
--                 { model
--                     | attack = NoAttack
--                     , nodes = nodes |> Dict.insert from settlementFrom_
--                 }
--                     ! []
--         _ ->
--             { model | attack = NoAttack } ! []
