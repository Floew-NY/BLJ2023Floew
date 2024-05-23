package ch.noseryoung.blj.Vehicles;

public class MigrosBus extends Bus {
    public int cumulusMuiltiplier;

    public MigrosBus(String name, int price, int speed, int capacity, int requiredAge, boolean highwayApproval,
            int doorsAmount, int cumulusMuiltiplier) {
        super(name, price, speed, capacity, requiredAge, highwayApproval, doorsAmount);
        this.cumulusMuiltiplier = cumulusMuiltiplier;
    }

}
