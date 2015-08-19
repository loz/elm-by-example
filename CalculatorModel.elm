module CalculatorModel where

import Char
import Maybe exposing (withDefault)
import Result
import Set
import String

type ButtonType = Regular | Large

-- type ListOfInts = Nil | Cons Int ListOfInts
type GenericList a = Nil | Cons a (GenericList a)

buttonSize: ButtonType -> Int
buttonSize size =
  case size of
    Regular -> 60
    Large -> 120

listSize: GenericList a -> Int
listSize lst =
  case lst of
    Nil -> 0
    Cons _ tail -> 1 + listSize tail

type alias CalculatorState = {
  input: String,
  operator: String,
  number: Float
}

initialState = { number = 0.0, operator = "", input = ""}

isOper: String -> Bool
isOper btn = Set.member btn (Set.fromList ["+", "-", "*", "/", "="])

calculate: Float -> String -> String -> Float
calculate number op input =
  let number2 = withDefault 0.0 (Result.toMaybe (String.toFloat input))
  in
     if | op == "+" -> number + number2
        | op == "-" -> number - number2
        | op == "*" -> number * number2
        | op == "/" -> number / number2
        | otherwise -> number2

step: String -> CalculatorState -> CalculatorState
step btn state =
  if | btn == "C" -> initialState
     | btn == "CE" -> { state | input <- "0" }
     | state.input == "" && isOper btn -> { state | operator <- btn }
     | isOper btn -> {
        number = calculate state.number state.operator state.input,
        operator = btn,
        input = ""
      }
     | otherwise -> {
        state | input <-
                if | (state.input == "" || state.input == "0") && btn == "." -> "0."
                   | state.input == "" || state.input == "0" -> btn
                   | String.length state.input >= 18 -> state.input
                   | btn == "." && String.any (\c -> c == '.') state.input -> state.input
                   | otherwise -> state.input ++ btn }

showState: CalculatorState -> String
showState {number,input} =
  if input == ""
     then toString number
     else input

