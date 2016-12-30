module Atrapos.Game.Update exposing (update)

import Dict
import Window
import Navigation
import Return exposing (mapBoth)
import Common.Dict exposing ((#))
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Solution as Solution
import Atrapos.Game.Link.Update as Link
import Atrapos.Game.Shared exposing (link, victory)
import Atrapos.Game.Selection.Update as Selection
import Atrapos.Game.Orientation as Orientation
import Atrapos.Game.Init exposing (init_)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case (msg, model) of
        (Init (Ok (size, level)), Loading) -> 
            init_ size level
        
        (_, Loaded model) -> 
            let (model_, cmd) = update_ msg model
            in (Loaded model_, cmd)

        _ -> Debug.crash "game update not found"


update_ : Msg -> Model_ -> ( Model_, Cmd Msg )
update_ msg ({ nodes, links, menu, back } as model) =
    case msg of
        Reset ->
            ({ model | links = links |> Dict.map (always Link.reset) } |> victory) ! []

        Help ->
            (model |> Solution.apply |> victory) ! []

        Mouse Click ->
            { model | menu = not menu } ! []

        Mouse EdgeSwipe -> 
            { model | back = True } ! []

        Mouse (Up {x} as msg) ->
            if back then
                ( model
                  , if x > 1.5 then Navigation.back 1 else Cmd.none
                )
            else 
                selection msg model

        Mouse msg ->
            selection msg model

        WindowSizeChanged size ->
            ({ model | windowSize = size } |> Orientation.update , Cmd.none)

        _ ->
            model ! []

selection msg model =
    (Selection.update msg model, Cmd.none)

