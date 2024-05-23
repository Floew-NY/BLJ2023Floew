package ch.noseryoung.blj;

import java.time.LocalDate;
import java.util.ArrayList;

import ch.noseryoung.blj.Vehicles.Bus;
import ch.noseryoung.blj.Vehicles.MigrosBus;

public class Starter {
    public static void main(String[] args) throws Exception {
        VehicleRentalManager vehicleRentalManager = new VehicleRentalManager();

        Person person = new Person("John", LocalDate.of(1, 1, 1));

        Bus bus = new Bus("cool", 1000, 10, 324, 17, true, 32);

        MigrosBus migrosBus = new MigrosBus("busuuuus", 34, 234, 1, 16, false, 0, 2);

        vehicleRentalManager.getVehicles().add(bus);
        vehicleRentalManager.getVehicles().add(migrosBus);

        vehicleRentalManager.getCustomers().add(person);

        vehicleRentalManager.getContracts().add(
                new Contract(vehicleRentalManager, person, bus, LocalDate.now(), LocalDate.now().plusDays(7), "cool"));
        vehicleRentalManager.getContracts().add(
                new Contract(vehicleRentalManager, person, bus, LocalDate.now().plusDays(1),
                        LocalDate.now().plusDays(6),
                        "cool"));

        vehicleRentalManager.getDenylist().add(person);

        printList(vehicleRentalManager.getVehicles());
        printList(vehicleRentalManager.getCustomers());
        printList(vehicleRentalManager.getContracts());
        printList(vehicleRentalManager.getDenylist());

    }

    public static <T> void printList(ArrayList<T> list) {
        for (T item : list) {
            System.out.println(item.toString());
        }
    }
}
