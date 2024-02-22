
public class GuessedWordException extends Exception {
    public int guessCount;
    public GuessedWordException(int guessCount) {
        this.guessCount = guessCount;
    }
}