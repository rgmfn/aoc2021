import qualified Data.Text    as Text
import qualified Data.Text.IO as Text

f :: [String] -> [String]
f strs = filter (\x -> head x == 'f') strs

-- d :: [String] -> [Int]
-- d strs = filter (\x -> x !! 0 == 'd') strs

-- u :: [String] -> [Int]
-- u strs = filter (\x -> x !! 0 == 'u') strs

-- solve :: [String] -> Int
-- solve strs = (f strs) * ((d strs) - (u strs))

textToStrs :: [Text.Text] -> [String]
textToStrs = map (read . Text.unpack)

main :: IO ()
main = do
    ls <- fmap Text.lines (Text.readFile "test.txt")
    let input = textToStrs ls
    -- print (solve input)
    print(f input)
