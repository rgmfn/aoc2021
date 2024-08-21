import qualified Data.Text    as Text
import qualified Data.Text.IO as Text

tripleSum list = zipWith3 (\x y z -> x + y + z) list (tail list) (tail . tail $ list)

diffs list = map (\(x, y) -> y - x) (zip list (tail list))
norm x
    | x <= 0 = 0
    | otherwise = 1

solve :: [Int] -> Int
solve = sum . (map norm) . diffs . tripleSum
-- solve = tripleSum

textToInts :: [Text.Text] -> [Int]
textToInts = map (read . Text.unpack)

main :: IO ()
main = do
    ls <- fmap Text.lines (Text.readFile "input.txt")
    let input = textToInts ls
    print (solve input)
