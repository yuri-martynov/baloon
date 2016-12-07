module Ballon.Update exposing (update)

import Common.ViewBox exposing (fromMouse)
import Ballon.Model exposing (..)
import Ballon.Msg exposing (..)
import Ballon.Cmd exposing (getBoomRadius)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ state, windowSize } as model) =
    case ( msg, state ) of
        ( WindowSizeChanged s, _ ) ->
            { model | windowSize = Just s } ! []

        ( Start position, Na ) ->
            case windowSize of
                Just size ->
                    let
                        { x, y } =
                            fromMouse size position
                    in
                        { model
                            | state = Blowing { radius = 0.0, x = x, y = y, boomRadius = Nothing }
                        }
                            ! [ getBoomRadius ]

                _ ->
                    update NoOp model

        ( Boom, _ ) ->
            { model | state = Na } ! []

        ( Blow, Blowing ({ radius, boomRadius } as blowing) ) ->
            case boomRadius of
                Just boomRadius ->
                    if radius > boomRadius then
                        update Boom model
                    else
                        { model
                            | state = Blowing { blowing | radius = radius + 1.0 }
                        }
                            ! []

                _ ->
                    update NoOp model

        ( BoomRadiusChanged boomRadius, Blowing blowing ) ->
            { model | state = Blowing { blowing | boomRadius = Just boomRadius } } ! []

        ( Stop, Blowing { radius, x, y } ) ->
            { model | state = Flying { radius = radius, y = y, x = x } } ! []

        ( Up, Flying ({ y, radius } as state) ) ->
            if (y < -radius) then
                update Boom model
            else
                { model | state = Flying { state | y = y - 5.0 } } ! []

        _ ->
            model ! []
