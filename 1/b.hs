import Data.Text qualified as Text
import Data.Text.IO qualified as Text

import Utils

tripleSum list = zipWith3 (\x y z -> x + y + z) list (tail list) (tail . tail $ list)

solve :: [Int] -> Int
solve = sum . map norm . diffs . tripleSum

main :: IO ()
main = do
  ls <- fmap Text.lines (Text.readFile "input.txt")
  let input = textToInts ls
  print (solve input)
