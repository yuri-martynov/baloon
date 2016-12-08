module Common.WindowSize exposing (..)

import Window exposing (Size, resizes, size)
import Task exposing (perform)


init : (Size -> msg) -> Cmd msg
init sizeMsg =
    size |> perform sizeMsg


subscriptions : (Size -> msg) -> Sub msg
subscriptions sizeMsg =
    resizes sizeMsg
