
public class Starter {
  public static void main(String[] args) {
    Automaton automaton = new Automaton(90, "0".repeat(3) + "1" + "0".repeat(3));
    automaton.run(automaton.getCurrentGeneration().length());
    new AutomatonRenderer(automaton, 1);
  }
}
