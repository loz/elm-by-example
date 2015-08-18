module DelayedCircles where

import DelayedMousePositions exposing (delayedMousePositions)
import DrawCircles exposing (drawCircles)
import Fibonacci exposing (fibonacci)
import List exposing (reverse, tail)
import Signal exposing ((~), (<~))
import Window

main =
  drawCircles
    <~ delayedMousePositions (fibonacci 8 |> reverse)
    ~ Window.dimensions
