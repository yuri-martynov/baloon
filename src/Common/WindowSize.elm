module Common.WindowSize exposing (..)

import Window exposing (Size, resizes, size)
import Task exposing (perform)


init : msg -> (Size -> msg) -> Cmd msg
init noOp sizeMsg =
    size |> perform (always noOp) sizeMsg


subscriptions : (Size -> msg) -> Sub msg
subscriptions sizeMsg =
    resizes sizeMsg
