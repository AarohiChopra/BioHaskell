-- to get arguments from command line
-- also added Data.time to calc time
import System.Environment (getArgs)
import Control.Monad (unless)
import Data.Time (getCurrentTime, diffUTCTime)

-- defines a data type to only store ID, sequence and quality
data FastqFile = FastqFile
    { seqID :: String , sequence :: String , quality :: String } 
    deriving Show

-- Read list of 4 strings
-- Make sure each base has a quality associated to it
readEntry :: [String] -> Maybe FastqFile
readEntry [name, seqLine, _, qualLine]
    | inp = Just $ FastqFile name sequence quality
    | otherwise = Nothing
  where
    inp = length seqLine == length qualLine
    sequence =  seqLine 
    quality =  qualLine 
readEntry _ = Nothing

-- starts with reading fasta file
-- reads all read entries
readFastQ :: FilePath -> IO [FastqFile]
readFastQ arg = do
    seqData <- readFile arg
    let ele = lines seqData -- split one record in 4 elements
    let reads = readEntries ele []
    return reads
  where
    readEntries :: [String] -> [FastqFile] -> [FastqFile]
    readEntries [] acc = reverse acc -- this was important to prevent the sequences from being flippedso reversing records to maintain order
    readEntries ele acc =
        case readEntry (take 4 ele) of
            Just record -> readEntries (drop 4 ele) (record : acc)
            Nothing -> error "Incorrect file contents"

-- Example usage
main :: IO ()
main = do
    args <- getArgs
    begin <- getCurrentTime
    case args of
        [arg] -> do
            records <- readFastQ arg
            putStrLn "PARSING THE FILE: "
            mapM_ print records
            end <- getCurrentTime
            let time = diffUTCTime end begin
            putStrLn $ "Total time: " ++ show time
        _ -> putStrLn "Invalid Arguments, check the readme for command useage"

