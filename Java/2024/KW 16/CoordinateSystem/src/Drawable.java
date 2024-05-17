import java.awt.Graphics2D;

public interface Drawable {
    public static final int hello = 0;

    void draw(Graphics2D g2d, int fieldScale, int fieldSize);
}