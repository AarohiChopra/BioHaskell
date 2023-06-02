import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
public class script {
    public static void main(String[] args) {
        // to calc time
        long startTime = System.currentTimeMillis(); 

        String filename = args[0];
        String format = args[1];
        ArrayList<String> ids = new ArrayList<String>();
        ArrayList<String> seqs = new ArrayList<String>();
        ArrayList<String> quals = new ArrayList<String>();
        boolean isFastq = format.equalsIgnoreCase("fastq");

        // Read the file and parse the sequences
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line;
            String currentId = "";
            StringBuilder currentSeq = new StringBuilder();
            StringBuilder currentQual = new StringBuilder();
            while ((line = br.readLine()) != null) {
                if (line.startsWith(">") || line.startsWith("@")) { // sequence header detected
                    if (!currentSeq.toString().isEmpty()) { // store previous sequence
                        ids.add(currentId);
                        seqs.add(currentSeq.toString());
                        if (isFastq)
                            quals.add(currentQual.toString());
                    }
                    currentId = line.substring(1).trim(); // extract sequence ID
                    currentSeq = new StringBuilder();
                    currentQual = new StringBuilder();
                } else {
                    if (isFastq && currentSeq.length() == 0) { // first non-header line is the sequence
                        currentSeq.append(line.trim());
                    } else if (isFastq && currentSeq.length() > 0 && currentQual.length() == 0) { // second non-header line is quality
                        currentQual.append(line.trim());
                    } else { // append sequence or quality to current entry
                        if (!isFastq)
                            currentSeq.append(line.trim());
                        else
                            currentQual.append(line.trim());
                    }
                }
            }
            // store the last sequence
            ids.add(currentId);
            seqs.add(currentSeq.toString());
            if (isFastq)
                quals.add(currentQual.toString());
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        }

        // Print the sequences
        for (int i = 0; i < ids.size(); i++) {
            System.out.println("*******************");
            System.out.println("ENTRY NUMBER: " + (i + 1));
            System.out.println();
            System.out.println("SEQUENCE ID: " + ids.get(i));
            System.out.println();
            System.out.println("SEQUENCE: " + seqs.get(i));
            System.out.println();
            if (isFastq) {
                System.out.println("SEQUENCE QUALITY: " + quals.get(i));
                System.out.println();
            }
            System.out.println();
        }

        long endTime = System.currentTimeMillis(); // End time
        long executionTime = endTime - startTime;
        System.out.println("Execution time: " + executionTime + " milliseconds");
    }
}
