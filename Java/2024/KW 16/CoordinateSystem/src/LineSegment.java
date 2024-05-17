import java.awt.Color;
import java.awt.Graphics2D;

public class LineSegment implements Drawable {
    public int id;
    static int increment = 1;

    private CSPoint[] points;

    public LineSegment(CSPoint point1, CSPoint point2) {
        this.points = new CSPoint[] { point1, point2 };
        this.id = increment++;
    }

    public CSPoint[] getPoints() {
        return points;
    }

    public void draw(Graphics2D g2d, int fieldScale, int fieldSize) {
        CSPoint translatedPoint1 = Translator.translatePoint(this.points[0], fieldScale, fieldSize);
        CSPoint translatedPoint2 = Translator.translatePoint(this.points[1], fieldScale, fieldSize);
        g2d.setColor(Color.RED);
        g2d.drawLine(translatedPoint1.x, translatedPoint1.y, translatedPoint2.x, translatedPoint2.y);
    }
}
