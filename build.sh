#!/bin/sh
elm-make src/DetectRTC.elm --output=site/js/elm-detect-rtc.js
elm-make src/DetectRTCExample.elm --output=site/js/elm-detect-rtc-example.js
cp vendor/DetectRTC.js site/js
