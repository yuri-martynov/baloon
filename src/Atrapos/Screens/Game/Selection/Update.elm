module Atrapos.Screens.Game.Selection.Update exposing (update)

import Dict
import Common.Dict as Dict
import Common.Types exposing (Location)
import Common.Math exposing (len)
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Link.Update as Link
import Atrapos.Screens.Game.Shared exposing (link)
import Atrapos.Screens.Game.Selection.Path as Selection


update : MouseMsg -> Model_ -> Model_
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

-- PRIVATE ---------------------------------------

select : Location -> Selection -> Model_ -> Model_
select p {lastNode} model =
    case ( lastNode, nearestNode p model ) of
        ( Nothing, Just first ) ->
            model |> updateLastNode first

        ( Just last, Just next ) ->
            model |> selectNext last next

        _ ->
            model


selectNext : NodeId -> NodeId -> Model_ -> Model_
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
                    |> Link.toggle
                    |> link model id
                    |> updateLastNode next


updateLastNode : NodeId -> Model_ -> Model_
updateLastNode id model =
    { model | selection = Just { lastNode = Just id } }


nearestNode : Location -> Model_ -> Maybe NodeId
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
                if l < 1.5 then
                    Just id
                else
                    Nothing
