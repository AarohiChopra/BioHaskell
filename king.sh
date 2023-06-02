#!/bin/bash

# Compile the Haskell file

echo -e "K-Mer Counter Program with k = 10 and"
echo -e "DNA Sequences length of 1,000,000\n"

echo "Haskell Version:"
runhaskell kMerCounter/kMerHaskell.hs
echo ""

echo "Java Version:"

cd kMerCounter
javac kMerJava.java
java kMerJava 
cd - > /dev/null

echo -e "\nPython Version:"
python kMerCounter/kMerPython.py
echo ""


echo -e "AT and CG Counter Program with DNA Sequences length of 1,000,000\n"

echo "Haskell Version:"
runhaskell ATCGCount/ATCGCountHaskell.hs
echo ""

echo "Java Version:"
cd ATCGCount
javac ATCGCountJava.java
java ATCGCountJava 
cd - > /dev/null
echo ""

echo "Python Version:"
python ATCGCount/ATCGCountPython.py
echo ""


echo -e "T -> U Transcription Program with DNA Sequences length of 1,000,000\n"

echo "Haskell Version:"
runhaskell TUTranscription/TUTranscriptionHaskell.hs
echo ""

echo "Java Version:"
cd TUTranscription
javac TUTranscriptionJava.java
java TUTranscriptionJava 
cd - > /dev/null
echo ""

echo "Python Version:"
python TUTranscription/TUTranscriptionPython.py
echo ""

# Pause at the end of the script
read -p "Press Enter to exit..."
