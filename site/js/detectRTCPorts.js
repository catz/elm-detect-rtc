//////////////////////////////////////////////////////////////////////
//
// detectRTCPorts.js
// JavaScript side of ports of elm-detect-rtc
// Copyright (c) 2017 Roman Truschev <truschev@gmail.com>
// Some rights reserved.
// Distributed under the MIT License
// See LICENSE.txt
//
//////////////////////////////////////////////////////////////////////

var detectRTCPorts = {};

(function () {
  detectRTCPorts.init = init;

  function init() {
    var detect = Elm.DetectRTCExample.embed(document.getElementById("elm-area"));
    detectRTCPorts.detect = detect;

    detect.ports.requestHasWebcam.subscribe(function(state) {
      detect.ports.receiveHasWebcam.send(DetectRTC.hasWebcam);
    });

    detect.ports.requestHasMicrophone.subscribe(function(state) {
      detect.ports.receiveHasMicrophone.send(DetectRTC.hasMicrophone);
    });

    detect.ports.requestHasSpeakers.subscribe(function(state) {
      detect.ports.receiveHasSpeakers.send(DetectRTC.hasSpeakers);
    });
  }

})();
