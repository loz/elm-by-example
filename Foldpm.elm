module Foldpm where

import Signal exposing (foldp)

compose: List (a -> b -> Maybe b) -> (a -> b -> Maybe b)
compose steps = 
  case steps of
    [] -> \_ _ -> Nothing
    f::fs -> \a b ->
      case f a b of
        Nothing -> (compose fs) a b
        Just x -> Just x

foldpm: (a -> b -> Maybe b) -> b -> Signal a -> Signal b
foldpm stepm b sa =
  let step event state =
    case stepm event state of
      Nothing -> state
      Just x -> x
  in
     foldp step b sa
