public class Starter {
    public static void main(String[] args) throws Exception {
        CoordinateSystem cs = new CoordinateSystem(500);
        cs.addPoint(new CSPoint(30, 50));
        cs.addPoint(new CSPoint(10, 20));
        new CSRenderer(cs,1,10);
    }
}
