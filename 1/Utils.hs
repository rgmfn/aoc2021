module Utils
  ( textToInts
  , diffs
  , norm
  ) where

import Data.Text qualified as Text

textToInts :: [Text.Text] -> [Int]
textToInts = map (read . Text.unpack)

diffs :: [Int] -> [Int]
diffs list = zipWith (-) (tail list) list

norm x
    | x <= 0 = 0
    | otherwise = 1
