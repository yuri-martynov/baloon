module Atrapos.Game.Selection.Update exposing (update)

import Dict
import Common.Dict as Dict exposing ((#))
import Common.Types exposing (Location)
import Common.Math exposing (len, intersect)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Link.Update as Link
import Atrapos.Game.Shared exposing (link, victory, updateCounter)
import Atrapos.Game.Selection.Path exposing (selected)


update : MouseMsg -> Model_ -> ( Model_, Cmd Msg )
update msg model =
    case ( msg, model.selection ) of
        ( Down p, _ ) ->
            case nearestNode p model of
                Just n ->
                    ( model |> updateLastNode n p
                    , Cmd.none
                    )

                Nothing ->
                    ( { model | selection = Deselection { startLocation = p, endLocation = p } }
                    , Cmd.none
                    )

        ( Move p, Selection selection ) ->
            model
                |> updateEndLocation p
                |> select p selection

        ( Move p, Deselection deselection ) ->
            model
                |> updateEndLocation p
                |> deselect p deselection

        ( Up _, _ ) ->
            { model | selection = None } ! []

        _ ->
            model ! []



-- PRIVATE ---------------------------------------

selectRadius = 0.85


select : Location -> SelectionModel -> Model_ -> ( Model_, Cmd Msg )
select p ({ lastNode } as selection) model =
    case nearestNode p model of
        Just next ->
            model |> selectNext lastNode next p

        _ ->
            { model | selection = Selection { selection | endLocation = p } } ! []


selectNext : NodeId -> NodeId -> Location -> Model_ -> ( Model_, Cmd Msg )
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
                ( model, Cmd.none )

            Just id ->
                links
                    |> Dict.justGet id
                    |> Link.select
                    |> link model id
                    |> updateLastNode next p
                    |> victory
                    |> updateCounter


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
                if l < selectRadius then
                    Just id
                else
                    Nothing


deselect : Location -> DeselectionModel -> Model_ -> ( Model_, Cmd Msg )
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
            ( model, Cmd.none )
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
                |> victory
                |> updateCounter


updateEndLocation : Location -> Model_ -> Model_
updateEndLocation p ({ selection } as model) =
    case selection of
        Selection s ->
            { model | selection = Selection { s | endLocation = p } }

        Deselection s ->
            { model | selection = Deselection { s | endLocation = p } }

        None ->
            model
