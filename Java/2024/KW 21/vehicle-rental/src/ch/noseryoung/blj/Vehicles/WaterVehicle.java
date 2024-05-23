package ch.noseryoung.blj.Vehicles;

public class WaterVehicle extends Vehicle {

    private int riskOfSinking;

    public WaterVehicle(String name, int price, int speed, int capacity, int requiredAge, int riskOfSinking) {
        super(name, price, speed, capacity, requiredAge);
        this.riskOfSinking = riskOfSinking;
    }
}
