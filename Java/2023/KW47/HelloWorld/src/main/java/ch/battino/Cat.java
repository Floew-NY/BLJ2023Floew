package ch.battino;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Cat {
    private String name;
    private int age;
    private String breed;
    private String color;
    private double weight;
    private boolean isIndoor;
    private String owner;
    private String healthStatus;
    private Date lastVetVisit;
    private String favoriteToy;

    public Cat(String name, int age, String breed, String color, String owner) {
        this.name = name;
        this.age = age;
        this.breed = breed;
        this.color = color;
        this.owner = owner;
    }

        @Override
        public String toString() {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return "Pet Information:\n" +
                    "Name: " + name + "\n" +
                    "Age: " + age + "\n" +
                    "Breed: " + breed + "\n" +
                    "Color: " + color + "\n" +
                    "Weight: " + weight + "\n" +
                    "Is Indoor: " + (isIndoor ? "Yes" : "No") + "\n" +
                    "Owner: " + owner + "\n" +
                    "Health Status: " + healthStatus + "\n" +
                    "Last Vet Visit: " + (lastVetVisit != null ? sdf.format(lastVetVisit) : "No data") + "\n" +
                    "Favorite Toy: " + favoriteToy;
        }

}
