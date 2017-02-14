module Atrapos.Game.Shared exposing (link, victory, linksLen, updateCounter)

import Dict
import Time
import Common.Time exposing (delay)
import Atrapos.Game.Model exposing (..)
import Atrapos.Game.Msg exposing (Msg(CounterAnimationCompleted))
import Atrapos.Game.Selection.Path as Selection
import Atrapos.Game.Solution as Solution


link : Model_ -> LinkId -> Link -> Model_
link ({ links } as model) id link =
    { model | links = links |> Dict.insert id link }
        |> victory


victory : Model_ -> Model_
victory model =
    { model | victory = isVictory model }


linksLen : Model_ -> Float
linksLen { links } =
    links
        |> Selection.selected
        |> Selection.len links

updateCounter : Model_ -> (Model_, Cmd Msg)
updateCounter ( { counter } as model) =
    ( { model 
        | counter = 
            (model |> linksLen) :: (counter |> List.take 1)
        , counterAnimation = True
      }
    , CounterAnimationCompleted |> delay (0.3 * Time.second)
    )

-- PRIVATE --------------------


isVictory : Model_ -> Bool
isVictory ({ minLen, nodes, links } as model) =
    let
        len =
            linksLen model
    in
        round (len)
            == round (minLen)
            && (Solution.isFullyConnected nodes links)


connected links id =
    links
        |> Dict.filter (always .selected)
        |> Dict.values
        |> List.any (\{ node1, node2 } -> node1 == id || node2 == id)
