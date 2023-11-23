package ch.battino;

import java.util.stream.IntStream;

public class Main{
public static void main(String[]args){
        System.out.println("HELLO");
        Cat[] cats = new Cat[5];
        for (int i = 0; i < 5; i++){
                cats[i] = new Cat("Jack", i+1, "black","red","uuid");
                System.out.println(cats[i].toString());
        }
        }
}