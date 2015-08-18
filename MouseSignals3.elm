module MouseSignals where

import Mouse
import Signal exposing (map2, (<~),(~), sampleOn)
import Graphics.Element exposing (show, flow, down, leftAligned)
import List exposing (map)
import Text

plaintext s = 
   leftAligned (Text.fromString s)


showsignals a b c d e f g =
        flow down
        <| map plaintext [
                "Mouse.position: " ++ toString a,
                "Mouse.x: " ++ toString b,
                "Mouse.y: " ++ toString c,
                "Mouse.clicks: " ++ toString d,
                "Mouse.isDown: " ++ toString e,
                "sampleOn Mouse.clicks Mouse.position: " ++ toString f,
                "sampleOn Mouse.isDown Mouse.position: " ++ toString g
                ]

main = showsignals
        <~ Mouse.position
        ~ Mouse.x
        ~ Mouse.y
        ~ Mouse.clicks
        ~ Mouse.isDown
        ~ sampleOn Mouse.clicks Mouse.position
        ~ sampleOn Mouse.isDown Mouse.position
