module Atrapos.Game.UI exposing (view)

import Dict
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (..)
import Atrapos.Game.Shared as Game


view: Model_ -> Html Msg -> Html Msg
view model viewGame  = 
    [ viewGame
    , ui model 
    ]
        |> div [class "container"]   


ui: Model_ -> Html Msg
ui ({victory, links} as model) =
    [ a 
        [ class "pure-button"
        , href "#levels" 
        ] 
        [text "back"]
    , button 
        [ class "pure-button"
        , onClick Reset 
        , resetDisabled model
        ] 
        [text "reset"]
    , button 
        [ class "pure-button"
        , onClick Help
        ] 
        [text "Help" ]
    , label [victoryClass model] [model |> Game.progress |> toString |> text]
    ]
        |> div [class "game-ui"]   

resetDisabled = 
    .links >> Dict.values >> List.any .selected >> not >> disabled

victoryClass {victory} =
    (if victory then "victory" else "") |> class
    

    