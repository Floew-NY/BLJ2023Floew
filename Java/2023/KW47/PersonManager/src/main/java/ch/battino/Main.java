package ch.battino;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("==============================================");
        System.out.println("WELCOME TO THE PERSON MANAGER FROM THE FUTUER:");
        System.out.println("==============================================");
        ArrayList<Person> personList= new ArrayList<Person>();

        do {
            personList.add(new Person());
            System.out.print(personList.getLast().toPrintable());
            System.out.println("Do you want to Add another Person? y/n");
            Scanner sc = new Scanner(System.in);
            String repeatPrompt = sc.nextLine();

            if (!repeatPrompt.toLowerCase().equals("y")){
                sc.close();
                break;
            }
        }while (true);
        Person.closeInput();
    }
}