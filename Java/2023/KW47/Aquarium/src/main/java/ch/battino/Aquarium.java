package ch.battino;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class Aquarium {
    private final int aquariumHeight;
    private final int aquariumWidth;
    private final boolean isSaltwater;
    private ArrayList<Fish> Fishes = new ArrayList<Fish>();


    public Aquarium(int aquariumHeight, int aquariumWidth, boolean isSaltwater) {
        this.aquariumHeight = aquariumHeight;
        this.aquariumWidth = aquariumWidth*Fish.getFishLength();
        this.isSaltwater = isSaltwater;
        Fishes.add(new Fish(10,1,"Josh","><(((('<>","><(((('<>","blue",true,true));
        Fishes.add(new Fish(1,1,"Josh","><(((('<>","><(((('<>","blue",true,true));
        Fishes.add(new Fish(100,2,"Josh","><(((('<>","><(((('<>","blue",true,true));
        Fishes.add(new Fish(10,3,"Josh","><(((('<>","><(((('<>","blue",true,true));

        Fishes.add(new Fish(10,1,"Josh","><(((('<>","><(((('<>","blue",true,true));

/*         Fishes.add(new Fish(3,2,"Josh","><))))'>>","blue",true,true));

        Fishes.add(new Fish(20,3,"Josh","><(((('<>","blue",true,true));
        Fishes.add(new Fish(30,4,"Josh","><(((('<>","blue",true,true));
 */    }

    public static Aquarium createAquarium() {
        System.out.println("Enter the Aquariums Height, Width and if its \"NOT\" saltwater seperated by a \",\"");
        int height;
        int width;
        boolean isSaltWater;
        while (true) {
            try {
                Scanner scan = new Scanner(System.in);
                //String inputAquarium = scan.nextLine();
                String inputAquarium = "20 meters tall, 20 meters wide, not saltwater";
                String[] anwsers = inputAquarium.toLowerCase().split(",");
                height = Integer.parseInt(anwsers[0].replaceAll("[^0-9]", ""));
                width = Integer.parseInt(anwsers[1].replaceAll("[^0-9]", ""));
                isSaltWater = !(anwsers[2].contains("no"));
                break;
            } catch (Exception err) {
                System.out.println(err.toString());
            }
        }
        return new Aquarium(height, width, isSaltWater);
    }

    private boolean isFish(int posX, int posY) {
        Fish []fishArray = this.Fishes.toArray(new Fish[0]);
        try {
            for (Fish fish : fishArray)
                if (fish.getPosXStart() <= posX && fish.getPosXEnd() >= posX && fish.getPosY() == posY)
                    return true;
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    private Fish posToFish(int posX, int posY) {
        Fish []fishArray = this.Fishes.toArray(new Fish[0]);
        for (Fish fish : fishArray)
            if (fish.getPosXStart() <= posX && fish.getPosXEnd() >= posX && fish.getPosY() == posY)
                return fish;
        return null;
    }

    public void displayAquarium() {
        StringBuilder printable = new StringBuilder();
        printable.append("/*");
        printable.append("=".repeat(aquariumWidth));
        printable.append("*\\\n");
        for (int y = 0; y < aquariumHeight; y++) {
            printable.append("||");
            for (int x = 0; x < aquariumWidth; x++) {
                if (!isFish(x, y))
                    printable.append(" ");
                else {
                    printable.append(posToFish(x, y).getTypeChar(posToFish(x, y).posInFish(x)));
                }
            }
            printable.append("||\n");
        }
        printable.append("/*");
        printable.append("=".repeat(aquariumWidth));
        printable.append("*\\\n");
        System.out.print("\033[H");
        System.out.print(printable);
    }

    public void repeatedRender(double speed) throws InterruptedException {
        while (true){
        displayAquarium();
        TimeUnit.MILLISECONDS.sleep((int)(speed*10));
        for (Fish fish:
             Fishes.toArray(new Fish[0])) {
            fish.moveFish(aquariumWidth);
        }
        }
    }

}
