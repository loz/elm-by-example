module TicTacToe where

import Graphics.Element exposing (Element)
import Mouse
import Signal exposing ((<~), Signal, foldp, mergeMany, sampleOn)
import TicTacToeModel exposing (..)
import TicTacToeView exposing (..)

clickSignal: Signal (Int, Int)
clickSignal = sampleOn Mouse.clicks Mouse.position

newGameSignal: Signal (GameState -> GameState)
newGameSignal = always (always initialState) <~ newGameMailbox.signal

undoSignal: Signal (GameState -> GameState)
undoSignal = always undoMoves <~ undoMailbox.signal

moveSignal: Signal (GameState -> GameState)
moveSignal = processClick <~ clickSignal

inputSignal: Signal (GameState -> GameState)
inputSignal = mergeMany [ moveSignal, newGameSignal, undoSignal ]

gameStateSignal: Signal GameState
gameStateSignal = foldp (<|) initialState inputSignal

main: Signal Element
main = view <~ gameStateSignal
