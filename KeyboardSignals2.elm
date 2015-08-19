module KeyboardSignals2 where

import Keyboard
import Signal exposing ((<~))
import Graphics.Element exposing (show)

main = show <~ Keyboard.presses
