module Atrapos.Screens.Game.Update exposing (updateWindowSize, update)

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


updateWindowSize : Window.Size -> Model -> ( Model, Cmd Msg )
updateWindowSize s model =
    ({ model | windowSize = s } |> Orientation.update , Cmd.none)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ nodes, links } as model) =
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

        _ ->
            model ! []






