import java.util.HashSet;
import java.util.Set;

public class CoordinateSystem {
    private Set<CSPoint> points;
    private int coordinateSystemSize;

    public CoordinateSystem(int coordinateSystemSize) {
        if (coordinateSystemSize < 1 || coordinateSystemSize % 20 != 0)
            throw new IllegalArgumentException(
                    "The Coordinate System must be positive and divisible by 20 without remainder.");
        this.coordinateSystemSize = coordinateSystemSize;
        points = new HashSet<CSPoint>();
    }

    public void addPoint(CSPoint point) {
        points.add(point);
    }

    public Set<CSPoint> getAllPoints() {
        return this.points;
    }

    public int getCoordinateSystemSize() {
        return this.coordinateSystemSize;
    }

}
