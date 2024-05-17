import java.awt.Point;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

public class CircleApp {
    public static void main(String[] args) throws Exception {
        int radius = 200;
        int x = 1204;
        int y = 844;
        Point startPoint = new Point(x, y);

        Robot robot = new Robot();

        robot.keyPress(KeyEvent.VK_ALT);
        robot.keyPress(KeyEvent.VK_TAB);
        robot.delay(10); // set the delay
        robot.keyRelease(KeyEvent.VK_ALT);
        robot.keyRelease(KeyEvent.VK_TAB);
        robot.delay(1000);

        mouseMove(robot, x, y);

        /*
         * Point mouseLocation = calculateCircleCoordinate(1 , radius, startPoint);
         * robot.mouseMove((int) mouseLocation.getX(), (int) mouseLocation.getY());
         * robot.mouseMove((int) mouseLocation.getX(), (int) mouseLocation.getY());
         * robot.mouseMove((int) mouseLocation.getX(), (int) mouseLocation.getY());
         * 
         * robot.delay(500);
         * 
         * robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
         * robot.delay(500);
         * robot.setAutoDelay(10);
         * for (int i = 1; i < 360; i++) {
         * mouseLocation = calculateCircleCoordinate(i , radius, startPoint);
         * robot.mouseMove((int) mouseLocation.getX(), (int) mouseLocation.getY());
         * robot.mouseMove((int) mouseLocation.getX(), (int) mouseLocation.getY());
         * robot.mouseMove((int) mouseLocation.getX(), (int) mouseLocation.getY());
         * 
         * }
         * robot.delay(500);
         * 
         * robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
         */
    }

    private static Point calculateCircleCoordinate(double degree, int radius, Point startPoint) {
        double radians = Math.toRadians(degree);
        int x = (int) (Math.sin(radians) * radius + startPoint.getX());
        int y = (int) (Math.cos(radians) * radius + startPoint.getY());
        System.out.println("x = " + x + "y = " + y);
        return new Point(x, y);
    }

    private static void mouseMove(Robot robot, int x, int y) {
        robot.setAutoDelay(100);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.mouseMove(x, y);
        robot.setAutoDelay(0);
    }
}
