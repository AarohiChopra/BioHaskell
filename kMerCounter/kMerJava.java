import java.util.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;

public class kMerJava {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String str = "";
        try{
            str = new String(Files.readAllBytes(Paths.get("DNA.txt")));
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        //System.out.print("Enter k-mer length: ");
        //int k = input.nextInt();
        int k = 10;
        Long start = System.currentTimeMillis();

        List<Map.Entry<String, Integer>> tuples = countKmers(k, str);

        Long end = System.currentTimeMillis();
        Long total_time = end - start;

        //System.out.println("K-mer counts:");
        //printTuples(tuples);

        System.out.println( "Total time: " + total_time + " milliseconds");
    }

    public static List<Map.Entry<String, Integer>> countKmers(int k, String str) {
        Map<String, Integer> counts = new HashMap<>();
        for (int i = 0; i <= str.length() - k; i++) {
            String kmer = str.substring(i, i + k);
            counts.merge(kmer, 1, Integer::sum);
        }
        List<Map.Entry<String, Integer>> tuples = new ArrayList<>(counts.entrySet());
        Collections.sort(tuples, Map.Entry.comparingByValue(Comparator.reverseOrder()));
        return tuples;
    }

    public static void printTuples(List<Map.Entry<String, Integer>> tuples) {
        for (Map.Entry<String, Integer> tuple : tuples) {
            System.out.println(tuple.getKey() + ": " + tuple.getValue());
        }
    }
}


/*import java.util.*;  
class kMerJava   
{  
public static void main(String[] args)  
{  
Scanner sc= new Scanner(System.in);    //System.in is a standard input stream  
System.out.print("Enter any DNA sequence- ");  
String  a= sc.nextLine();  
System.out.print("Enter number k for k-mer counting - ");  
int k= sc.nextInt();  
System.out.println("DNA sequence = " + a);

Long start = System.currentTimeMillis();
for(int i = 0 ; i < a.length() ; i++){
    if(i+k > a.length())
        break;
    String m = a.substring(i, i+k);
    System.out.println( k + "-mer #" + i + ": " + m);
}

Long end = System.currentTimeMillis();
Long total_time = end - start;
System.out.println( "Total time: " + total_time + " milliseconds");

}  
} */