package ch.noseryoung.blj;

import java.util.ArrayList;

import ch.noseryoung.blj.Vehicles.Vehicle;

public class VehicleRentalManager {
    private ArrayList<Vehicle> vehicles;
    private ArrayList<Person> customerList;
    private ArrayList<Person> denylist;
    private ArrayList<Contract> contracts;

    public VehicleRentalManager() {
        vehicles = new ArrayList<Vehicle>();
        customerList = new ArrayList<Person>();
        denylist = new ArrayList<Person>();
        contracts = new ArrayList<Contract>();

    }

    public ArrayList<Vehicle> getVehicles() {
        return vehicles;
    }

    public ArrayList<Person> getCustomers() {
        return customerList;
    }

    public ArrayList<Person> getDenylist() {
        return denylist;
    }

    public ArrayList<Contract> getContracts() {
        return contracts;
    }

}
