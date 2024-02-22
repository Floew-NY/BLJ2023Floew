import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

/**
 * WordleEngine
 */
public class WordleEngine {
    private String word;

    public WordleEngine(String language, int length) {
        System.out.println("initializig...");
        genWord(language, length);
        System.out.println("initialized!");
    }

    private HashMap<LetterState, String> colorMap() {
        HashMap<LetterState, String> colorHashMap = new HashMap<LetterState, String>();
        colorHashMap.put(LetterState.CORRECT, "\033[42m");
        colorHashMap.put(LetterState.CONTAINED, "\033[43m");
        colorHashMap.put(LetterState.WRONG, "\033[41m");
        return colorHashMap;
    }

    public void genWord(String language,int length) {
        try {
            URL url = new URL("https://random-word-api.herokuapp.com/word?lang="+ language +"&length=" + length);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String response = reader.readLine();
                reader.close();

                word = response.replaceAll("\\[\"|\"\\]|\"", "");
            } else {
                System.out.println("HTTP request failed with response code: " + responseCode);
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("are you online...?");
        }
    }

    public void printResult(String guess) {
        StringBuilder print = new StringBuilder();
        char[] guessLetters = guess.toCharArray();
        LetterState[] guessChecked = checkGuess(guess);
        HashMap<LetterState, String> colorMap = colorMap();
        for (int i = 0; i < guessLetters.length; i++) {
            print.append(colorMap.get(guessChecked[i]));
            print.append(guessLetters[i]);
            print.append("\033[0m");
        }
        System.out.print("\033[A\033[2K\r");
        System.out.println(print.toString());
    }

    private enum LetterState {
        CORRECT,
        CONTAINED,
        WRONG
    }

    private LetterState[] checkGuess(String guess) {
        guess = guess.toLowerCase();
        String correctWord = word.toLowerCase();
        LetterState[] result = new LetterState[guess.length()];
        for (int i = 0; i < guess.length(); i++) {
            if (guess.charAt(i) == correctWord.charAt(i))
                result[i] = LetterState.CORRECT;
            else if (conainsLetter(guess.charAt(i)))
                result[i] = LetterState.CONTAINED;
            else
                result[i] = LetterState.WRONG;
        }
        return result;
    }

    public boolean checkWin(String guess) {
        return guess.toLowerCase().equals(word.toLowerCase());
    }

    private boolean conainsLetter(char character) {
        String correctWord = word.toLowerCase();
        for (int i = 0; i < correctWord.length(); i++) {
            if (correctWord.charAt(i) == character)
                return true;
        }
        return false;
    }

    public String getWord() {
        return word;
    }
}