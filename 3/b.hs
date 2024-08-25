import Data.Char (digitToInt)
import Data.Text qualified as Text
import Data.Text.IO qualified as Text

import Utils

getMostCommon list = map (aboveHalf l) (combine list)
  where
    l = length list

myFilter :: Int -> (Int -> Int -> Bool) -> [[Int]] -> [Int]
myFilter _ _ [x] = x
myFilter index op list =
  myFilter (index + 1) op (filter (\bin -> op val (bin !! index)) list)
  where
    l = length list
    mostCommon = getMostCommon list
    val = mostCommon !! index

solve :: [String] -> Int
solve strs = binToDec oxy * binToDec co2
  where
    bins = convert strs
    oxy = myFilter 0 (==) bins
    co2 = myFilter 0 (/=) bins

main :: IO ()
main = do
  ls <- fmap Text.lines (Text.readFile "input.txt")
  let input = map Text.unpack ls
  print (solve input)
