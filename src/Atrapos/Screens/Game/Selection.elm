module Atrapos.Screens.Game.Selection exposing (update)

import Dict
import Common.Dict as Dict
import Common.Types exposing (Location)
import Common.Math exposing (len)
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Objects.Link.Update as Link
import Atrapos.Screens.Game.Shared exposing (link)


update : MouseMsg -> Model -> Model
update msg model =
    case ( msg, model.selection ) of
        ( Down, _ ) ->
            { model | selection = Just { lastNode = Nothing } }

        ( Move p, Just selection ) ->
            select p selection model

        ( Up, _ ) ->
            { model | selection = Nothing }

        _ ->
            model


select : Location -> Selection -> Model -> Model
select p {lastNode} model =
    case ( lastNode, nearestNode p model ) of
        ( Nothing, Just first ) ->
            model |> updateLastNode first

        ( Just last, Just next ) ->
            model |> selectNext last next

        _ ->
            model


selectNext : NodeId -> NodeId -> Model -> Model
selectNext last next ({ links } as model) =
    let
        nextLink =
            links
                |> Dict.filter
                    (\_ { node1, node2 } ->
                        (node1 == last && node2 == next) || (node2 == last && node1 == next)
                    )
                |> Dict.keys
                |> List.head
    in
        case nextLink of
            Nothing ->
                model

            Just id ->
                links
                    |> Dict.justGet id
                    |> Link.select
                    |> link model id
                    |> updateLastNode next


updateLastNode : NodeId -> Model -> Model
updateLastNode id model =
    { model | selection = Just { lastNode = Just id } }


nearestNode : Location -> Model -> Maybe NodeId
nearestNode p { nodes } =
    let
        node =
            nodes
                |> Dict.map (\_ n -> len p n)
                |> Dict.toList
                |> List.sortBy Tuple.second
                |> List.head
    in
        case node of
            Nothing ->
                Debug.crash "nearestNode"

            Just ( id, l ) ->
                if l < 2 then
                    Just id
                else
                    Nothing
