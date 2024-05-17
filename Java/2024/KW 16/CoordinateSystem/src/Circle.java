import java.awt.Color;
import java.awt.Graphics2D;

public class Circle implements Drawable {
    public int id;
    static int increment = 1;

    private CSPoint centerPoint;
    private int radius;

    public Circle(CSPoint centerPoint, int radius) {
        this.id = increment++;
        this.centerPoint = centerPoint;
        this.radius = radius;
    }

    @Override
    public void draw(Graphics2D g2d, int fieldScale, int fieldSize) {
        CSPoint translatedPoint = Translator.translatePoint(centerPoint, fieldScale, fieldSize);
        g2d.setColor(Color.BLACK);
        g2d.drawOval((int) (translatedPoint.getX() - radius), (int) (translatedPoint.getY() - radius), radius * 2,
                radius * 2);
    }

}
