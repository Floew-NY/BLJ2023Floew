package dev.battino;

import java.awt.*;

public class Starter {
    public static void main(String[] args) {
        int[][] level = {
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 1, 1, 1, 1, 1, 0, 0},
                {0, 1, 1, 1, 0, 0, 0, 1, 0, 0},
                {0, 1, 4, 0, 3, 0, 0, 1, 0, 0},
                {0, 1, 1, 1, 0, 3, 4, 1, 0, 0},
                {0, 1, 4, 1, 1, 3, 0, 1, 0, 0},
                {0, 1, 0, 1, 0, 4, 0, 1, 1, 0},
                {0, 1, 3, 0, 5, 3, 3, 4, 1, 0},
                {0, 1, 0, 0, 0, 4, 0, 0, 1, 0},
                {0, 1, 1, 1, 1, 1, 1, 1, 1, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
        };
        Point playerStartPosition = new Point(3, 3);


        new GameIO(new Game(level, playerStartPosition), 32);
    }
}
