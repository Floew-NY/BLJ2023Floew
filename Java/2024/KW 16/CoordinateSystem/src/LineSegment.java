public class LineSegment  {
    public int id;
    static int increment = 1;

    private CSPoint[] points;

    public LineSegment(CSPoint point1, CSPoint point2) {
        this.points = new CSPoint[]{point1, point2};
        this.id = increment++;
    }
    public CSPoint[] getPoints() {
        return points;
    }
}
