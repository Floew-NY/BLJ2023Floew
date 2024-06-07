import dev.battino.Game;
import org.junit.jupiter.api.Test;

import java.awt.*;

import static org.junit.jupiter.api.Assertions.*;


public class GameTest {

    @Test
    void test_moveRight_fromFloor_toFloor() {
        int[] expectedLevelLine = {0, 0, 0};
        Point expectedPlayer = new Point(1, 0);
        int[] initialLevelLine = {0, 0, 0};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toWall() {
        int[] expectedLevelLine = {0, 1, 0};
        Point expectedPlayer = new Point(0, 0);
        int[] initialLevelLine = {0, 1, 0};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }

    @Test
    void test_moveRight_fromFloor_toBox() {
        int[] expectedLevelLine = {0, 0, 3};
        Point expectedPlayer = new Point(1, 0);
        int[] initialLevelLine = {0, 3, 0};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toGoal() {
        int[] expectedLevelLine = {0, 0, 0};
        Point expectedPlayer = new Point(1, 0);
        int[] initialLevelLine = {0, 0, 0};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toWall_withBox() {
        int[] expectedLevelLine = {0, 3, 1};
        Point expectedPlayer = new Point(0, 0);
        int[] initialLevelLine = {0, 3, 1};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toBox_withBox() {
        int[] expectedLevelLine = {0, 3, 3};
        Point expectedPlayer = new Point(0, 0);
        int[] initialLevelLine = {0, 3, 3};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toButton_withBox() {
        int[] expectedLevelLine = {0, 0, 5};
        Point expectedPlayer = new Point(1, 0);
        int[] initialLevelLine = {0, 3, 4};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromButton_toFloor_withBox() {
        int[] expectedLevelLine = {0, 4, 3};
        Point expectedPlayer = new Point(1, 0);
        int[] initialLevelLine = {0, 5, 0};
        Point initialPlayer = new Point(0, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toOutOfBounds() {
        int[] expectedLevelLine = {0, 0, 0};
        Point expectedPlayer = new Point(2, 0);
        int[] initialLevelLine = {0, 0, 0};
        Point initialPlayer = new Point(2, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }
    @Test
    void test_moveRight_fromFloor_toOutOfBounds_withBox() {
        int[] expectedLevelLine = {0, 0, 3};
        Point expectedPlayer = new Point(1, 0);
        int[] initialLevelLine = {0, 0, 3};
        Point initialPlayer = new Point(1, 0);
        genericTest(expectedLevelLine, expectedPlayer, initialLevelLine, initialPlayer);
    }

    void genericTest(int[] expectedLevelLine, Point expectedPlayer, int[] initialLevelLine, Point initialPlayer) {
        int[][] expectedLevel = new int[1][expectedLevelLine.length];
        expectedLevel[0] = expectedLevelLine;
        int[][] initialLevel = new int[1][initialLevelLine.length];
        initialLevel[0] = initialLevelLine;
        Game game = new Game(initialLevel,initialPlayer);
        game.moveRight();
        assertArrayEquals(expectedLevel, game.getField());
        assertEquals(expectedPlayer, game.getPlayer());
    }
}
