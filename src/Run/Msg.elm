module Run.Msg exposing (Msg)

import Run.Screens.BlackScreen.Msg as BlackScreen


type Msg =
    | BlackScreenMsg BlackScreen.Msg
