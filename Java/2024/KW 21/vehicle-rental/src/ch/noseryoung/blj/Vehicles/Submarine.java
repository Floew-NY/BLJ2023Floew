package ch.noseryoung.blj.Vehicles;

public class Submarine extends WaterVehicle {

    private int waterPressure;

    public Submarine(String name, int price, int speed, int capacity, int requiredAge, int riskOfSinking,
            int waterPressure) {
        super(name, price, speed, capacity, requiredAge, riskOfSinking);
        this.waterPressure = waterPressure;
    }

}
