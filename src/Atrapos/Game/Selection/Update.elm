module Atrapos.Game.Selection.Update exposing (update)

import Dict
import Common.Dict as Dict exposing ((#))
import Common.Types exposing (Location)
import Common.Math exposing (len, intersect)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Link.Update as Link
import Atrapos.Game.Shared exposing (link, victory, linksLen)
import Atrapos.Game.Selection.Path exposing (selected)


update : MouseMsg -> Model_ -> Model_
update msg model =
    case ( msg, model.selection ) of
        ( Down p, _ ) ->
            case nearestNode p model of
                Just n ->
                    model |> updateLastNode n p

                Nothing ->
                    { model | selection = Deselection { startLocation = p, endLocation = p } }

        ( Move p, Selection selection ) ->
            model
                |> select p selection
                |> updateEndLocation p

        ( Move p, Deselection deselection ) ->
            model
                |> deselect p deselection
                |> updateEndLocation p

        ( Up _, _ ) ->
            { model | selection = None }

        _ ->
            model



-- PRIVATE ---------------------------------------


select : Location -> SelectionModel -> Model_ -> Model_
select p ({ lastNode } as selection) model =
    case nearestNode p model of
        Just next ->
            model |> selectNext lastNode next p

        _ ->
            { model | selection = Selection { selection | endLocation = p } }


selectNext : NodeId -> NodeId -> Location -> Model_ -> Model_
selectNext last next p ({ links } as model) =
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
                    |> updateLastNode next p
                    |> saveCounter 
                    |> victory


updateLastNode : NodeId -> Location -> Model_ -> Model_
updateLastNode id p model =
    { model | selection = Selection { lastNode = id, endLocation = p } }


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


deselect : Location -> DeselectionModel -> Model_ -> Model_
deselect p { startLocation } ({ links, nodes } as model) =
    let
        deselect_ a b linkIds acc =
            case linkIds of
                [] ->
                    acc

                id :: rest ->
                    let
                        { node1, node2 } =
                            links # id

                        acc_ =
                            if intersect a b (nodes # node1) (nodes # node2) then
                                id :: acc
                            else
                                acc
                    in
                        deselect_ a b rest acc_

        deselectIds =
            deselect_ startLocation p (selected links) []
    in
        if deselectIds == [] then
            model
        else
            { model
                | links =
                    links
                        |> Dict.map
                            (\id link ->
                                if deselectIds |> List.member id then
                                    link |> Link.reset
                                else
                                    link
                            )
            } 
                |> saveCounter
                |> victory


updateEndLocation : Location -> Model_ -> Model_
updateEndLocation p ({ selection } as model) =
    case selection of
        Selection s ->
            { model | selection = Selection { s | endLocation = p } }

        Deselection s ->
            { model | selection = Deselection { s | endLocation = p } }

        None ->
            model



saveCounter : Model_ -> Model_
saveCounter ( { counter } as model) =
    { model 
        | counter = 
            (model |> linksLen) :: (counter |> List.take 1)
    }
