module Atrapos.Game.Data.Model exposing (..)

type alias Model =
    { nodes : List Node
    , links : List Link
    }


type alias Node =
    ( Int, Int )


type alias Link =
    ( Int, List Int )
