import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Main {
    public static void main(String args[]) {
        try {
            BufferedReader stdReader =
                new BufferedReader(new InputStreamReader(System.in));
            String line;
            while ((line = stdReader.readLine()) != null) {
                int num = Integer.parseInt(line);
                System.out.println((int)Math.pow(num, 3));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
