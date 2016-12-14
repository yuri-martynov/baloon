module Common.Maybe exposing (return)


return : Maybe a -> a
return maybe =
    case maybe of
        Just value ->
            value

        Nothing ->
            Debug.crash "'Maybe' has no value"
