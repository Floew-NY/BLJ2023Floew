import java.sql.Date;
import java.io.FileWriter;
import java.io.IOException;
import java.io.BufferedWriter;
import java.io.File;
import java.io.PrintWriter;

public class Stats {
    public Date date;
    public String language;
    public int length;
    public long time;
    public int guessCount;
    public String word;
    public boolean win;

    public Stats() {
        date = new Date(System.currentTimeMillis());
        guessCount = 0;
        win = false;
    }

    void saveStatsToFile() {
        // appends stats to file stats.txt
        try {
            File file = new File("stats.txt");
            FileWriter fr = new FileWriter(file, true);
            BufferedWriter br = new BufferedWriter(fr);
            PrintWriter pr = new PrintWriter(br);
            pr.println("Date: " + date);
            pr.println("Language: " + language);
            pr.println("Length: " + length);
            long minutes = time / 60000;
            long seconds = (time % 60000) / 1000;
            pr.println("Time: " + minutes + " mins " + seconds + " secs");
            pr.println("Guesses: " + guessCount);
            pr.println("Word: " + word);
            pr.println("Win: " + win);
            pr.println();
            pr.close();
            br.close();
            fr.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
