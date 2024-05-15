public class Starter {
    public static void main(String[] args) throws Exception {
        CoordinateSystem cs = new CoordinateSystem(1000);
        cs.addDrawable(new CSPoint(1, 1));
        cs.addDrawable(new CSPoint(10, 20));
        cs.addDrawable(new LineSegment(new CSPoint(50, 100), new CSPoint(100, 50)));
        new CSRenderer(cs, 1, 10);
    }
}
