import qualified Data.Text    as Text
import qualified Data.Text.IO as Text
import Data.Char (digitToInt)

-- 
solve :: Int -> Int -> Int -> [String] -> Int
solve d u f [] = f * (d - u)
solve d u f (x:xs) =
    let amt = digitToInt (last x)
    in case head x of
        'd' -> solve (d+amt) u f xs
        'u' -> solve d (u+amt) f xs
        'f' -> solve d u (f+amt) xs

textToStrs :: [Text.Text] -> [String]
textToStrs = map Text.unpack

main :: IO ()
main = do
    ls <- fmap Text.lines (Text.readFile "input.txt")
    let input = textToStrs ls
    print(solve 0 0 0 input)
