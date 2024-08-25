import Data.Text qualified as Text
import Data.Text.IO qualified as Text

import Utils

solve :: [Int] -> Int
solve = sum . map norm . diffs

main :: IO ()
main = do
  ls <- fmap Text.lines (Text.readFile "input.txt")
  let input = textToInts ls
  print (solve input)
