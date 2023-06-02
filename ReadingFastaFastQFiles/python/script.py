#!pip install argparse
#!pip install Bio
import argparse
from Bio import SeqIO
import time

# Setting up argument parser to take command line inputs
parser = argparse.ArgumentParser(description="Reading FASTA/FASTQ files")
parser.add_argument('filename', help='Enter file name')
parser.add_argument('format', choices=['fasta', 'fastq'], help='Enter File format')

# Read the args in command line
args = parser.parse_args()

# Start the timer
start_time = time.time()

# Open files
with open(args.filename, 'r') as inp:
    seq = SeqIO.parse(inp, args.format)
    i = 1
    for entry in seq:
        print("*******************")
        print("ENTRY NUMBER: ", i)
        i += 1
        print("SEQUENCE ID: ", entry.id)
        print("SEQUENCE: ", entry.seq)
        if(args.format == 'fastq'):
            print("SEQUENCE QUALITY: ", entry.letter_annotations["phred_quality"][:])
        print()

# Calculate the elapsed time
elapsed_time = time.time() - start_time
print("Elapsed time:", elapsed_time, "seconds")
