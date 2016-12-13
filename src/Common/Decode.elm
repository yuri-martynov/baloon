module Common.Decode exposing (..)

import Json.Decode as Decode exposing (Decoder, andThen, succeed, fail)


-- DECODERS --------------------------------------------
-- Custom decoder in elm 0.18


customDecoder : Decoder b -> (b -> Result String a) -> Decoder a
customDecoder decoder toResult =
    andThen
        (\a ->
            case toResult a of
                Ok b ->
                    succeed b

                Err err ->
                    fail err
        )
        decoder


decodeAlways : Decoder ()
decodeAlways =
    succeed ()