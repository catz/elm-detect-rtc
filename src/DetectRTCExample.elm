module DetectRTCExample exposing (..)

import Html exposing (..)
import DetectRTC exposing (..)


type alias Model =
    { hasWebcam : Bool
    , hasMicrophone : Bool
    , hasSpeakers : Bool
    }


type Msg
    = HasWebcam Bool
    | HasMicrophone Bool
    | HasSpeakers Bool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HasWebcam state ->
            { model | hasWebcam = state } ! []

        HasMicrophone state ->
            { model | hasMicrophone = state } ! []

        HasSpeakers state ->
            { model | hasSpeakers = state } ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ receiveHasWebcam (\state -> HasWebcam state)
        , receiveHasMicrophone (\state -> HasMicrophone state)
        , receiveHasSpeakers (\state -> HasSpeakers state)
        ]


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text ("hasWebcam: " ++ toString (model.hasWebcam)) ]
        , div [] [ text ("hasMicrophone: " ++ toString (model.hasMicrophone)) ]
        , div [] [ text ("hasSpeakers: " ++ toString (model.hasSpeakers)) ]
        ]


init : ( Model, Cmd Msg )
init =
    ( Model False False False
    , Cmd.batch
        [ requestHasWebcam ()
        , requestHasMicrophone ()
        , requestHasSpeakers ()
        ]
    )


main : Program Never Model Msg
main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }
