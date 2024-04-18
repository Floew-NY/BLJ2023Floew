public class Starter {
    public static void main(String[] args) throws Exception {
        CoordinateSystem cs = new CoordinateSystem(500);
        cs.addPoint(new CSPoint(30, 50));
        cs.addPoint(new CSPoint(10, 20));
        cs.addLine(new LineSegment(new CSPoint(50,100), new CSPoint(100,50)));
        new CSRenderer(cs,1,3);
    }
}
