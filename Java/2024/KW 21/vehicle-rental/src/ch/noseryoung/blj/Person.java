package ch.noseryoung.blj;

import java.time.LocalDate;

public class Person {
    private String name;
    private LocalDate birthYear;

    public Person(String name, LocalDate birthYear) {
        this.name = name;
        this.birthYear = birthYear;
    }

    public String getName() {
        return name;
    }

    public LocalDate getBirthYear() {
        return birthYear;
    }
}
