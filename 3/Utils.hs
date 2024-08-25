module Utils
    (aboveHalf
    , binToDec
    , combine
    , convert
    ) where

-- 1 if above l/2, 0 otherwise
aboveHalf :: Int -> Int -> Int
aboveHalf l x
  | x >= ((l+1) `div` 2) = 1
  | otherwise = 0

-- turns a list of ints representing a binary number to decimal form
-- [1,0,0,1] -> 9 | [0,1,1,1] -> 7
binToDec :: [Int] -> Int
binToDec list = sum $ zipWith toPow (reverse list) [0 ..]
  where
    toPow bit exp = bit * (2 ^ exp)

-- collapses al lists onto each other [[1, 2], [3, 4], [5, 6]] -> [1+3+5, 2+4+6]
combine :: [[Int]] -> [Int]
combine = foldl1 (zipWith (+))

-- ["0110", "1010", ...] -> [[0,1,1,0], [1,0,1,0], ...]
convert :: [String] -> [[Int]]
convert = map (map (\c -> read [c] :: Int))
