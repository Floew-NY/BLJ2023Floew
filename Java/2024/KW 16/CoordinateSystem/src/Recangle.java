import java.awt.Color;
import java.awt.Graphics2D;

public class Recangle implements Drawable {
    public int id;
    static int increment = 1;

    private CSPoint topLeftPoint;
    private int width;
    private int height;

    public Recangle(CSPoint topLeftPoint, int width, int height) {
        this.id = increment++;
        this.topLeftPoint = topLeftPoint;
        this.width = width;
        this.height = height;
    }

    @Override
    public void draw(Graphics2D g2d, int fieldScale, int fieldSize) {
        CSPoint translatedPoint = Translator.translatePoint(topLeftPoint, fieldScale, fieldSize);
        g2d.setColor(Color.BLACK);
        g2d.drawRect((int) translatedPoint.getX(), (int) translatedPoint.getY(), width, height);
    }

}
