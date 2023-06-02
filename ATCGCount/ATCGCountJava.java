import java.util.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;

public class ATCGCountJava {
    public static void main(String[] args) {
        String dna = "";
        try{
            dna = new String(Files.readAllBytes(Paths.get("DNA.txt")));
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        int atCount = 0;
        int cgCount = 0;

        Long start = System.currentTimeMillis();

        for (int i = 0; i < dna.length() - 1; i++) {
            String dinucleotide = dna.substring(i, i + 2);
            if (dinucleotide.equals("AT")) {
                atCount++;
            } else if (dinucleotide.equals("CG")) {
                cgCount++;
            }
        }

        Long end = System.currentTimeMillis();
        Long total_time = end - start;

        System.out.println("Number of AT pairs: " + atCount);
        System.out.println("Number of CG pairs: " + cgCount);
        System.out.println( "Total time: " + total_time + " milliseconds");
    }
}
