module Atrapos.Routes exposing (Route(..), parse, url, navigateTo)

import Navigation exposing (Location)
import UrlParser exposing (map, s, string, int, oneOf, Parser, (</>), parseHash)
import Atrapos.Data.Model as Level


type Route
    = NotFound
    | Levels
    | Level Level.Id


url_ : Route -> String
url_ route =
    case route of
        Levels ->
            "levels"

        Level id ->
            "levels/" ++ (toString id)

        _ ->
            Debug.crash "not found"


url : Route -> String
url =
    url_ >> (++) "#"


route : Parser (Route -> a) a
route =
    oneOf
        [ map Level (s "levels" </> int)
        , map Levels (s "levels")
        ]


parse : Location -> Route
parse =
    parseHash route
        >> Maybe.withDefault NotFound


navigateTo : Route -> Cmd msg
navigateTo =
    url >> Navigation.newUrl
