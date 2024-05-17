public class Starter {
    public static void main(String[] args) throws Exception {
        CoordinateSystem cs = new CoordinateSystem(1000);
        cs.addDrawable(new CSPoint(1, 1));
        cs.addDrawable(new CSPoint(10, 20));
        cs.addDrawable(new LineSegment(new CSPoint(50, 100), new CSPoint(100, 50)));
        cs.addDrawable(new Recangle(new CSPoint(100, 100), 100, 120));
        cs.addDrawable(new Square(new CSPoint(-100, -100), 120));
        cs.addDrawable(new Circle(new CSPoint(100, 100), 50));
        cs.addDrawable(new Triangle(new CSPoint(-300, 100), new CSPoint(100, 200), new CSPoint(200, 170)));

        new CSRenderer(cs, 1, 10);

    }
}
