import time

class DNASequence:
    def __init__(self, sequence):
        # Validate input sequence
        if not self.is_valid_sequence(sequence):
            raise ValueError("Invalid DNA sequence: " + sequence)

        # Convert input sequence to uppercase
        self.sequence = sequence.upper()

    def get_sequence(self):
        return self.sequence

    def get_rna_sequence(self):
        # Replace all occurrences of T with U
        return self.sequence.replace("T", "U")

    def is_valid_sequence(self, sequence):
        # Check that input sequence only contains valid nucleotides (A, T, C, G)
        return all(nucleotide in "ATCG" for nucleotide in sequence)

if __name__ == '__main__':
    with open('DNA.txt', 'r') as f:
        input_sequence = f.read()

    # Calculate time to run function
    startTime = int(round(time.time() * 1000))  
    
    dna = DNASequence(input_sequence)

    dna_sequence = dna.get_sequence()
    #print("DNA sequence:", dna_sequence) 

    rna_sequence = dna.get_rna_sequence()

    endTime = int(round(time.time() * 1000))
    total = endTime - startTime
    #print("RNA sequence:", rna_sequence) 
    print(f'Total time: {total} miliseconds')