module Ballon.Msg exposing (..)
import Window 
import Mouse

type Msg
    = NoOp
    | WindowSizeChanged Window.Size
    | Start Mouse.Position
    | Stop
    | Blow
    | BoomRadiusChanged Float
    | Boom
    | Up
