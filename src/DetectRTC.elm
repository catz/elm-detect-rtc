port module DetectRTC exposing (..)

{-|
A DetectRTC port to Elm

# Common Helpers
@docs requestHasWebcam, receiveHasWebcam
@docs requestHasMicrophone, receiveHasMicrophone
@docs requestHasSpeakers, receiveHasSpeakers

-}

import Html exposing (..)


port requestHasWebcam : () -> Cmd msg


port receiveHasWebcam : (Bool -> msg) -> Sub msg


port requestHasMicrophone : () -> Cmd msg


port receiveHasMicrophone : (Bool -> msg) -> Sub msg


port requestHasSpeakers : () -> Cmd msg


port receiveHasSpeakers : (Bool -> msg) -> Sub msg
