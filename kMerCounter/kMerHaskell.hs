import Data.List (sort, group)
import Data.Map.Strict (fromListWith, toList)
import Data.Time.Clock
import System.IO

countKmers :: Int -> String -> [(String, Int)]
countKmers k str = toList $ fromListWith (+) [(take k $ drop i str, 1) | i <- [0..length str - k]]

main :: IO ()
main = do

  --start <- getCurrentTime
  dna <- readFile "DNA.txt"
  --putStrLn "Enter k:"
  --kStr <- getLine
  start <- getCurrentTime

  let k = 10
      counts = countKmers k dna
      sortedCounts = sort counts
  
  end <- getCurrentTime
  let diff = (diffUTCTime end start) * 1000 

  --mapM_ (\(kmer, count) -> putStrLn $ kmer ++ ": " ++ show count) counts

  putStrLn $ "Total time: " ++ show diff ++ " miliseconds"
