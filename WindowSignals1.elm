module WindowSignals1 where

import Graphics.Element exposing (down, flow, show, leftAligned)
import List exposing (map)
import Signal exposing ((~), (<~))
import Text
import Window

plaintext s = 
   leftAligned (Text.fromString s)

showsignals a b c =
        flow down
        <| map plaintext [
                "Window.dimensions: " ++ toString a,
                "Window.width: " ++ toString b,
                "Window.height: " ++ toString c
                ]

main = showsignals 
        <~ Window.dimensions
        ~ Window.width
        ~ Window.height
