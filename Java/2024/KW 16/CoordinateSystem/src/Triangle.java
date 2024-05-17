import java.awt.Color;
import java.awt.Graphics2D;

public class Triangle implements Drawable {
    public int id;
    static int increment = 1;

    private CSPoint point1;
    private CSPoint point2;
    private CSPoint point3;

    public Triangle(CSPoint point1, CSPoint point2, CSPoint point3) {
        this.id = increment++;
        this.point1 = point1;
        this.point2 = point2;
        this.point3 = point3;
    }

    @Override
    public void draw(Graphics2D g2d, int fieldScale, int fieldSize) {
        CSPoint translatedPoint1 = Translator.translatePoint(point1, fieldScale, fieldSize);
        CSPoint translatedPoint2 = Translator.translatePoint(point2, fieldScale, fieldSize);
        CSPoint translatedPoint3 = Translator.translatePoint(point3, fieldScale, fieldSize);

        int[] xPoints = { (int) translatedPoint1.getX(), (int) translatedPoint2.getX(), (int) translatedPoint3.getX() };
        int[] yPoints = { (int) translatedPoint1.getY(), (int) translatedPoint2.getY(), (int) translatedPoint3.getY() };

        g2d.setColor(Color.CYAN);
        g2d.drawPolygon(xPoints, yPoints, 3);
    }
}
