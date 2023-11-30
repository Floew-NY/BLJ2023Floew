package ch.battino;

public class Entrypoint {
    public static void main(String[] args) throws InterruptedException {
        Aquarium aquarium = Aquarium.createAquarium();
        aquarium.repeatedRender(2.0);

    }

}