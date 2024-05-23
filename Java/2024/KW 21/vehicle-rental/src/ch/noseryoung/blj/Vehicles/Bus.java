package ch.noseryoung.blj.Vehicles;

public class Bus extends LandVehicle {

    private int doorsAmount;

    public Bus(String name, int price, int speed, int capacity, int requiredAge, boolean highwayApproval,
            int doorsAmount) {
        super(name, price, speed, capacity, requiredAge, highwayApproval);
        this.doorsAmount = doorsAmount;
    }
}
