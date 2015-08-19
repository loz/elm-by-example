module KeyboardSignals4 where

import Keyboard
import Signal exposing ((<~))
import Graphics.Element exposing (show)

main = show <~ Keyboard.arrows
