-- to get arguments from command line
import System.Environment (getArgs)
import Data.Time (getCurrentTime, diffUTCTime) 

-- starts with reading fasta file
readFasta :: FilePath -> IO [(String, String)]
readFasta file = do
    seqData <- readFile file
    return $ parseFasta seqData

-- parses through all the sequence reads of the files and returns sequences
parseFasta :: String -> [(String, String)]
parseFasta seqData = map parseEntry $ filter (not . null) $ seprator '>' seqData

-- reads every single read content and grabs the header and sequence
parseEntry :: String -> (String, String)
parseEntry read = (header, concat seq)
    where (header:seq) = lines read
-- 
-- | Splits a string into a list of strings based on a separator
seprator :: Char -> String -> [String]
seprator sep xs = case break (== sep) xs of
    (ys, []) -> [ys]
    (ys, _:zs) -> ys : seprator sep zs

-- | The main function, which takes the input fasta file as a command line argument
-- and prints out the header and sequence for each read in the file
main :: IO ()
main = do
    args <- getArgs
    begin <- getCurrentTime
    case args of
        [file] -> do
            fasta <- readFasta file
            mapM_ print fasta
            end <- getCurrentTime
            let time = diffUTCTime end begin
            putStrLn $ "Total time: " ++ show time
        _ -> putStrLn "Usage: fasta-reader <fasta file>"
