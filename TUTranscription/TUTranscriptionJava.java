import java.util.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;

public class TUTranscriptionJava {
    private String sequence;

    public TUTranscriptionJava(String sequence) {
        // Validate input sequence
        if (!isValidSequence(sequence)) {
            throw new IllegalArgumentException("Invalid DNA sequence: " + sequence);
        }
        // Convert input sequence to uppercase
        this.sequence = sequence.toUpperCase();
    }

    public String getSequence() {
        return sequence;
    }

    public String getRNASequence() {
        // Replace all occurrences of T with U
        return sequence.replaceAll("T", "U");
    }

    private boolean isValidSequence(String sequence) {
        // Check that input sequence only contains valid nucleotides (A, T, C, G)
        return sequence.matches("[ATCG]+");
    }

    public static void main(String[] args) {

        String inputSequence = "";
        try{
            inputSequence = new String(Files.readAllBytes(Paths.get("DNA.txt")));
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        
        // Check the time to run the function
        Long start = System.currentTimeMillis();

        TUTranscriptionJava dna = new TUTranscriptionJava(inputSequence);

        String dnaSequence = dna.getSequence();
        //System.out.println("DNA sequence: " + dnaSequence); // Output: ATCGTACG

        String rnaSequence = dna.getRNASequence();
        //System.out.println("RNA sequence: " + rnaSequence); // Output: AUCGUACG

        Long end = System.currentTimeMillis();
        Long total_time = end - start;
        System.out.println( "Total time: " + total_time + " milliseconds");
    }
}
