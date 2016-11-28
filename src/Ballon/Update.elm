module Ballon.Update exposing (update)

import Ballon.Model exposing (..)
import Ballon.Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ state } as model) =
    case ( msg, state ) of
        ( Start, Na ) ->
            { model | state = Blowing { radius = 0.0 } } ! []

        ( Boom, _ ) ->
            { model | state = Na } ! []

        ( Blow, Blowing ({ radius } as blowing) ) ->
            if (radius > 50) then
                update Boom model
            else
                { model
                    | state = Blowing { blowing | radius = radius + 1.0 }
                }
                    ! []

        ( Stop, Blowing { radius } ) ->
            { model | state = Flying { radius = radius, y = 150.0 } } ! []

        ( Up, Flying ({ y, radius } as state) ) ->
            if (y < -radius) then
                update Boom model
            else
                { model | state = Flying { state | y = y - 5.0 } } ! []

        _ ->
            model ! []
