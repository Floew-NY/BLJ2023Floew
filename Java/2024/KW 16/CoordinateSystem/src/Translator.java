import java.awt.Point;

public class Translator {
    static CSPoint translatePoint(Point point, int fieldScale, int fieldSize) {
        return new CSPoint(point.x * fieldScale + fieldSize / 2, fieldSize / 2 - point.y * fieldScale);
    }
}
