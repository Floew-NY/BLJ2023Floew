import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

class Input {
    Scanner scanner;

    Input() {
        scanner = new Scanner(System.in);
    }

    public String inputString() {
        return scanner.nextLine();
    }

    public String inputStringWithLength(int length) {
        while (true) {
            String input = inputString();
            if (input.length() < length)
                System.out.println("Input too short");
            else if (input.length() > length)
                System.out.println("Input too long");
            else
                return input;
        }
    }

    public int inputInt() {
        while (true) {
            try {
                return Integer.parseInt(inputString());
            } catch (NumberFormatException e) {
                System.out.println("Invalid input, enter a Number!!!");
            }
        }
    }

    void closeInput() {
        scanner.close();
    }

}

public class App {
    public static Input input;

    public static void main(String[] args) throws Exception {
        Stats stats = new Stats();
        input = new Input();
        System.out.println("Available languages:");
        System.out.println("en\n es\n de\n fr\n it");
        System.out.println("Enter the language you want to play in");
        String language = input.inputString();
        System.out.println("Enter the length of the word you want to guess");
        int length = input.inputInt();
        WordleEngine engine = new WordleEngine(language, length);
        // System.out.println(engine.getWord());
        System.out.println("Welcome to Wordle!");
        System.out.println("_".repeat(engine.getWord().length()));
        
        try {
            for (int i = 0; i < 5; i++) {
                String guess = input.inputStringWithLength(engine.getWord().length());
                engine.printResult(guess);
                if (engine.checkWin(guess)) {
                    throw new GuessedWordException(i);
                }
            }
            System.out.println("You lost! The word was: " + engine.getWord());
        } catch (GuessedWordException e) {
            System.out.println("You guessed the word! The word was: " + engine.getWord());
            stats.win = true;
            stats.guessCount = e.guessCount;
            stats.word = engine.getWord();
        }
        stats.time = System.currentTimeMillis() - stats.time;
        stats.saveStatsToFile();
        input.closeInput();
    }
}