package ch.noseryoung.blj.Vehicles;

public class Onewheel extends LandVehicle {

    private int balanceDifficulty;

    public Onewheel(String name, int price, int speed, int capacity, int requiredAge, boolean highwayApproval,
            int balanceDifficulty) {
        super(name, price, speed, capacity, requiredAge, highwayApproval);
        this.balanceDifficulty = balanceDifficulty;
    }
}
