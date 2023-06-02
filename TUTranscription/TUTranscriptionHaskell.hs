module Main where

import Data.Char (toUpper)
import Data.Time.Clock

transcribe :: Char -> Char
transcribe 'T' = 'U'
transcribe nucleotide = nucleotide

isValidSequence :: String -> Bool
isValidSequence sequence = all (`elem` "ATCG") sequence

getRNASequence :: String -> String
getRNASequence sequence = map transcribe sequence

newtype DNASequence = DNASequence String

newDNASequence :: String -> Maybe DNASequence
newDNASequence sequence
  | isValidSequence sequence = Just $ DNASequence (map toUpper sequence)
  | otherwise = Nothing

main :: IO ()
main = do
    input_sequence <- readFile "DNA.txt"

    start <- getCurrentTime

    let maybe_dna = newDNASequence input_sequence
    case maybe_dna of
        Just dna -> do
            let rna_sequence = getRNASequence (getSequence dna)
            --putStrLn ("DNA sequence: " ++ getSequence dna)
            --putStrLn ("RNA sequence: " ++ rna_sequence)
            let result = "RNA sequence: " ++ rna_sequence
            putStrLn ("")
        Nothing -> putStrLn ("Invalid DNA sequence: " ++ input_sequence)

    end <- getCurrentTime
    let diff = (diffUTCTime end start) * 1000 
    putStrLn $ "Total time: " ++ show diff ++ " miliseconds"
    where getSequence (DNASequence sequence) = sequence


  
