package ch.noseryoung.blj.Vehicles;

public class LandVehicle extends Vehicle {

    private boolean highwayApproval;

    public LandVehicle(String name, int price, int speed, int capacity, int requiredAge, boolean highwayApproval) {
        super(name, price, speed, capacity, requiredAge);
        this.highwayApproval = highwayApproval;
    }

}
