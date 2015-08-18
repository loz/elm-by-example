module MouseSignals where

import Mouse
import Signal exposing (map2, (<~),(~))
import Graphics.Element exposing (show)


combine x y =
        show (x,y)

main = combine <~ Mouse.x ~ Mouse.y
