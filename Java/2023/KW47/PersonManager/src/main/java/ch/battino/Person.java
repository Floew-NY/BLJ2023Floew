package ch.battino;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Person {
    private String name = "your person's";
    private int age;
    private String originCountry;
    private ArrayList<String> favoriteFoods;
    private static final Scanner scan = new Scanner(System.in);



    public  Person(){
        allInput();
    }

    public void allInput(){
this.name = inputStr("Name:");
this.age = inputInt("Age:");
this.originCountry = inputStr("Country of Origin:");
String inputFavoriteFoods = inputStr("Favorite Foods Separated by a \";\"");
this.favoriteFoods = inputSeperator(inputFavoriteFoods);
    }


    public int inputInt(String inputAsked){
        System.out.println("Enter "+ this.name+"'s "+inputAsked);
        do {
        try {
            int temp = scan.nextInt();
            scan.nextLine();
            return temp;
        }catch (Exception ignored){
            System.out.println("ENTER A NUMBER!!!");
            scan.nextLine();
        }
        }while (true);
    }
    public String inputStr(String inputAsked){
        System.out.println("Enter "+ this.name+"'s "+inputAsked);
        return scan.nextLine();
    }
    private ArrayList<String> inputSeperator(String sentence){
        String[] array = sentence.replaceAll("[^a-zA-Z0-9;]", "").split(";");
        ArrayList<String> favFoods = new ArrayList<String>();
        favFoods.addAll(Arrays.asList(array));
        return favFoods;
    }

public String arraylistToString(ArrayList<String> favoriteFoods){
StringBuilder temp = new StringBuilder();
        for (String i:favoriteFoods){
temp.append("\n");
        }
        return temp.toString();
}

    public String toPrintable() {
        return "name:" + name + '\n' +
                "age:" + age + '\n'+
                "originCountry:'" + originCountry + '\n' +
                "favoriteFoods:" + '\n' + favoriteFoods + '\n';
    }
    public static void closeInput() {
        scan.close();
    }
}
