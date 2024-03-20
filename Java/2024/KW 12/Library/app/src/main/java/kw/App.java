
package kw;

import java.util.ArrayList;

public class App {
    public static void main(String[] args) {
        ArrayList<Medium> media = new ArrayList<Medium>();
        media.add(new Book("Fortnite For Dummies", "Wiley", 300, "Epic Games"));
        media.add(new Movie("Fornite Live Action", "Epic Games", "2h 30m", "Dwayne Johnson", "Epic Games"));
        media.add(new Videogame("Fortnite Siumlator in Roblox", "Roblox", "Roblox", "PC", "Epic Games"));
        media.add(new Book("Epic Fortnite Adventures, The Novel", "Walt Disney", 500, "Epic Games"));
        media.add(new Movie("Fortnite: The Movie", "Epic Games", "3h 30m", "Dwayne Johnson", "Epic Games"));
        media.add(new Videogame("Fortnite: The Game", "Epic Games", "Epic Games", "PC", "Epic Games"));
        media.add(new Book("Fortnite: The Comic", "Marvel", 100, "Epic Games"));
        media.add(new Movie("Fortnite: The Animated Series", "Epic Games", "1h 30m", "Dwayne Johnson", "Epic Games"));
        media.add(new Videogame("Epic Fortnite Adventures, The Game", "Epic Games", "Epic Games", "PC", "Epic Games"));

        StringBuilder sb = new StringBuilder();
            sb.append("[");
        for (Medium medium : media) {
            sb.append(medium.toJsonString());
            sb.append(",");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append("]");
        System.out.println(sb.toString());
    }
}
