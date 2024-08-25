import Data.Char (digitToInt)
import Data.Text qualified as Text
import Data.Text.IO qualified as Text

import Utils

solve :: [String] -> Int
solve strs = binToDec gammas * binToDec epsilons
  where
    l = length strs
    combined = combine . convert $ strs
    gammas = map (aboveHalf l) combined
    epsilons = map (1 -) gammas

main :: IO ()
main = do
  ls <- fmap Text.lines (Text.readFile "input.txt")
  let input = map Text.unpack ls
  print (solve input)
