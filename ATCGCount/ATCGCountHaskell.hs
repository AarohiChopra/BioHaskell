import Data.Time.Clock

countDinucleotides :: String -> (Int, Int)
countDinucleotides dna = go dna (0,0)
    where go [] counts = counts
          go [_] counts = counts
          go (x:y:xs) (atCount,cgCount)
            | [x,y] == "AT" = go (y:xs) (atCount+1,cgCount)
            | [x,y] == "CG" = go (y:xs) (atCount,cgCount+1)
            | otherwise = go (y:xs) (atCount,cgCount)

main :: IO ()
main = do

    start <- getCurrentTime 
    
    dna <- readFile "DNA.txt"
    
    let (atCount,cgCount) = countDinucleotides dna
    end <- getCurrentTime
    let diff = (diffUTCTime end start) * 1000 

    putStrLn ("Number of AT pairs: " ++ show atCount)
    putStrLn ("Number of CG pairs: " ++ show cgCount)

    putStrLn $ "Total time: " ++ show diff ++ " miliseconds"