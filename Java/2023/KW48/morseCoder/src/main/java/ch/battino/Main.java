package ch.battino;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter text to encode:");
        String stringInNormalText = scanner.nextLine();
        System.out.println("Encoded Morse: " + Morse.encode(stringInNormalText));

        System.out.println("Enter Morse code to decode:");
        String stringInMorsecode = scanner.nextLine();
        System.out.println("Decoded Text: " + Morse.decode(stringInMorsecode));

        scanner.close(); 
    }
}
