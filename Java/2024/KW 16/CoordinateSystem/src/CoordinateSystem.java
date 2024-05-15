import java.util.HashSet;
import java.util.Set;

public class CoordinateSystem {
    private Set<Drawable> drawables;

    private int coordinateSystemSize;

    public CoordinateSystem(int coordinateSystemSize) {
        if (coordinateSystemSize < 1 || coordinateSystemSize % 20 != 0)
            throw new IllegalArgumentException(
                    "The Coordinate System must be positive and divisible by 20 without remainder.");
        this.coordinateSystemSize = coordinateSystemSize;
        drawables = new HashSet<Drawable>();
    }

    public Set<Drawable> getAllDrawables() {
        return drawables;
    }

    public void addDrawable(Drawable drawable) {
        this.drawables.add(drawable);
    }

    public int getCoordinateSystemSize() {
        return this.coordinateSystemSize;
    }

}
