import Data.Char (digitToInt)
import Data.Text qualified as Text
import Data.Text.IO qualified as Text

solve :: Int -> Int -> Int -> [String] -> Int
solve d u f [] = f * (d - u)
solve d u f (x : xs) =
  let amt = digitToInt (last x)
   in case head x of
        'd' -> solve (d + amt) u f xs
        'u' -> solve d (u + amt) f xs
        'f' -> solve d u (f + amt) xs

main :: IO ()
main = do
  ls <- fmap Text.lines (Text.readFile "input.txt")
  let input = map Text.unpack ls
  print (solve 0 0 0 input)
