import java.awt.Color;
import java.awt.Graphics2D;

public class Square implements Drawable {
    public int id;
    static int increment = 1;

    private CSPoint topLeftPoint;
    private int sideLength;

    public Square(CSPoint topLeftPoint, int sideLength) {
        this.id = increment++;
        this.topLeftPoint = topLeftPoint;
        this.sideLength = sideLength;
    }

    @Override
    public void draw(Graphics2D g2d, int fieldScale, int fieldSize) {
        CSPoint translatedPoint = Translator.translatePoint(topLeftPoint, fieldScale, fieldSize);
        g2d.setColor(Color.BLACK);
        g2d.drawRect((int) translatedPoint.getX(), (int) translatedPoint.getY(), sideLength, sideLength);
    }

}
