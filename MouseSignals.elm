module MouseSignals where

import Mouse
import Signal exposing (map)
import Graphics.Element exposing (show)

main = map show Mouse.x
