import qualified Data.Text    as Text
import qualified Data.Text.IO as Text
import Data.Char (digitToInt)

solve :: Int -> Int -> Int -> [String] -> Int
solve h d a [] = h * d
solve h d a (x:xs) =
    let amt = digitToInt (last x)
    in case head x of
        'd' -> solve h d (a+amt) xs
        'u' -> solve h d (a-amt) xs
        'f' -> solve (h+amt) (d+a*amt) a xs

main :: IO ()
main = do
    ls <- fmap Text.lines (Text.readFile "input.txt")
    let input = map Text.unpack ls
    print(solve 0 0 0 input)
