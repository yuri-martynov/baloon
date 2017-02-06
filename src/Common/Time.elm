module Common.Time exposing (..)

import Time exposing (Time)
import Process
import Task


-- http://stackoverflow.com/questions/40599512/how-to-achieve-behavior-of-settimeout-in-elm


delay : Time -> msg -> Cmd msg
delay time msg =
    Process.sleep time
        |> Task.andThen (always <| Task.succeed msg)
        |> Task.perform identity
