public class Starter {
    public static void main(String[] args) throws Exception {
        CoordinateSystem cs = new CoordinateSystem(20);
        cs.addPoint(new CSPoint(3, 5));
        cs.addPoint(new CSPoint(1, 2));
        new CSRenderer(cs);
    }
}
