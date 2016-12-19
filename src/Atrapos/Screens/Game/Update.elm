module Atrapos.Screens.Game.Update exposing (update)

import Dict
import Window
import Return exposing (mapBoth)
import Common.Dict exposing ((#))
import Atrapos.Screens.Game.Model exposing (..)
import Atrapos.Screens.Game.Msg exposing (..)
import Atrapos.Screens.Game.Solution as Solution
import Atrapos.Screens.Game.Link.Update as Link
import Atrapos.Screens.Game.Shared exposing (link, victory)
import Atrapos.Screens.Game.Selection.Update as Selection
import Atrapos.Screens.Game.Orientation as Orientation
import Atrapos.Screens.Game.Init exposing (init_)


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
update_ msg ({ nodes, links } as model) =
    case msg of
        Reset ->
            ({ model | links = links |> Dict.map (always Link.reset) } |> victory) ! []

        Help ->
            (model |> Solution.apply |> victory) ! []

        Mouse msg ->
            ( Selection.update msg model, Cmd.none )

        LinkMsg id msg ->
            links
                # id
                |> Link.update msg
                |> mapBoth (LinkMsg id) (link model id)

        WindowSizeChanged size ->
            ({ model | windowSize = size } |> Orientation.update , Cmd.none)

        _ ->
            model ! []




