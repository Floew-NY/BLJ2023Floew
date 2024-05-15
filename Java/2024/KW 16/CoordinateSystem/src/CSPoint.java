import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Point;

public class CSPoint extends Point implements Drawable {
    public int id;
    static int increment = 1;

    CSPoint(int x, int y) {
        super(x, y);
        this.id = increment++;
    }

    CSPoint() {
        super(0, 0);
        this.id = increment++;
    }

    public void draw(Graphics2D g2d, int fieldScale, int fieldSize) {
        CSPoint translatedPoint = translatePoint(this, fieldScale, fieldSize);
        g2d.setColor(Color.BLUE);
        g2d.drawLine(translatedPoint.x, translatedPoint.y, translatedPoint.x, translatedPoint.y);
    }

    private CSPoint translatePoint(Point point, int fieldScale, int fieldSize) {
        return new CSPoint(point.x * fieldScale + fieldSize / 2, fieldSize / 2 - point.y * fieldScale);
    }

    @Override
    public String toString() {
        String var10000 = this.getClass().getName();
        return var10000 + "[id=" + this.id + ",x=" + this.x + ",y=" + this.y + "]";
    }
}
