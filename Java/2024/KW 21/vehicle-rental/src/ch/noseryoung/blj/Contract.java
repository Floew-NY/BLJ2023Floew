package ch.noseryoung.blj;

import java.lang.invoke.VarHandle;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import ch.noseryoung.blj.Vehicles.Vehicle;

public class Contract {
    private Person person;
    private Vehicle vehicle;
    private LocalDate startDate;
    private LocalDate endDate;
    private String contractualModalities;
    VehicleRentalManager vehicleRentalManager;

    public Contract(VehicleRentalManager vehicleRentalManager, Person person, Vehicle vehicle, LocalDate startDate,
            LocalDate endDate,
            String contractualModalities) throws IllegalArgumentException {

        this.vehicleRentalManager = vehicleRentalManager;

        int personAge = LocalDate.now().getYear() - person.getBirthYear().getYear();
        int requiredAge = vehicle.getRequiredAge();
        if (personAge < requiredAge)
            throw new IllegalArgumentException("Person is too young to rent this vehicle.");

        if (vehicleRentalManager.getDenylist().contains(person))
            throw new IllegalArgumentException("Person is on the denylist.");

        if (isContractColiding(this))
            throw new IllegalArgumentException("Vehicle is already rented out in this time period.");

        this.person = person;
        this.vehicle = vehicle;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractualModalities = contractualModalities;
    }

    private boolean isContractColiding(Contract comparedContract) {
        for (Contract existingContract : vehicleRentalManager.getContracts()) {
            if (existingContract.vehicle != comparedContract.vehicle)
                continue;

            Contract firstContract = existingContract.startDate.isBefore(comparedContract.startDate) ? existingContract
                    : comparedContract;
            Contract secondContract = existingContract.startDate.isBefore(comparedContract.startDate) ? comparedContract
                    : existingContract;

            int firstRenalLength = Period.between(firstContract.startDate, firstContract.endDate).getDays();
            int secondRentalLength = Period.between(secondContract.startDate, secondContract.endDate).getDays();
            int firstToEndOfSecondRentalLenght = Period.between(firstContract.startDate, secondContract.endDate)
                    .getDays();

            if (firstToEndOfSecondRentalLenght - firstRenalLength < secondRentalLength)
                return true;
        }
        return false;
    }

    public Person getPerson() {
        return person;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public String getContractualModalities() {
        return contractualModalities;
    }
}
