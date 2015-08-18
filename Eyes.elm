module Eyes where

import EyeModel exposing (..)
import EyesView exposing (..)
import Mouse
import Signal
import Window


eyes (w,h) (x,y) = 
        eyesView (w,h) (pupilsCoordinates (w,h) (x,y))

main = Signal.map2 eyes Window.dimensions Mouse.position

