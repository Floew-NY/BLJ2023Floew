import java.awt.Point;

public class CSPoint extends Point {
    int id;
    static int increment = 1;

    CSPoint(int x, int y) {
        super(x, y);
        this.id = increment++;
    }

    CSPoint() {
        super(0, 0);
        this.id = increment++;
    }

    @Override
    public String toString() {
        String var10000 = this.getClass().getName();
        return var10000 + "[id=" + this.id + ",x=" + this.x + ",y=" + this.y + "]";
    }
}
