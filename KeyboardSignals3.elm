module KeyboardSignals3 where

import Char
import Keyboard
import Signal exposing ((<~))
import Graphics.Element exposing (show)

main = show <~ (Keyboard.isDown (Char.toCode 'A'))
