module Ballon.Cmd exposing (getBoomRadius)

import Random
import Ballon.Msg exposing (Msg(BoomRadiusChanged))


getBoomRadius : Cmd Msg
getBoomRadius =
    Random.float 2.0 15.0
        |> Random.generate (boomRadius >> BoomRadiusChanged)


boomRadius : Float -> Float
boomRadius rnd =
    logBase 2 (rnd ^ 100.0)
