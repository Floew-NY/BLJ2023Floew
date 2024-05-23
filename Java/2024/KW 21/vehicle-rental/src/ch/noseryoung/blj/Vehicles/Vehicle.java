package ch.noseryoung.blj.Vehicles;

public class Vehicle {
    private String name;
    private int price;
    private int speed;
    private int capacity;
    private int requiredAge;

    public Vehicle(String name, int price, int speed, int capacity, int requiredAge) {
        this.name = name;
        this.price = price;
        this.speed = speed;
        this.capacity = capacity;
        this.requiredAge = requiredAge;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getSpeed() {
        return speed;
    }

    public int getCapacity() {
        return capacity;
    }

    public int getRequiredAge() {
        return requiredAge;
    }
}
