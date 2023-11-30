package ch.battino;

public class Fish {
    private double posXStart;
    private double posXEnd;
    private int posY;
    private String petName;
    private String activeTypeName;
        private String typeNameR;
                private String typeNameL;

    private String color;
    private boolean isMale;
    private boolean isSaltWater;
    private boolean goingRight;
    private double speed;

    private static final int fishLength = 8;

    public Fish(int posXStart, int posY, String petName, String typeNameR, String typeNameL, String color, boolean isMale, boolean isSaltWater) {
        this.posXStart = posXStart;
        this.posXEnd = posXStart+(fishLength-1);
        this.posY = posY;
        this.petName = petName;
        this.typeNameR = typeNameR;
          this.typeNameL = typeNameL;
        this.color = color;
        this.isMale = isMale;
        this.isSaltWater = isSaltWater;
        goingRight = true;
        speed = Math.random();
                if (goingRight) {
            activeTypeName = typeNameR;
        }else{
            activeTypeName = typeNameL;
}
    }
    
    public char getTypeChar(int index) {
        char []typeNameCharArray = this.activeTypeName.toCharArray();
        return typeNameCharArray[index];
    }
    
    public void setPosXStart(double posXStart) {
        this.posXStart = posXStart;
        this.posXEnd = posXStart+(fishLength-1);
    }
    
    public int getPosXStart() {
    return (int) Math.round(posXStart);
    }
    public int getPosXEnd() {
        return (int) Math.round(posXEnd);
    }
    public int posInFish(int posX){
        return this.getPosXEnd()-posX;
    }

    public int getPosY() {
        return posY;
    }

    public void setPosY(int posY) {
        this.posY = posY;
    }

    public static int getFishLength() {
        return fishLength;
    }

private boolean isAtEndOfAquarium(int aquariumWidth){
    if (goingRight) 
        return  aquariumWidth-1 <= this.posXEnd ;
    else
        return  0 >= this.posXStart;
    
}

    public void moveFish(int aquariumWidth){
if (isAtEndOfAquarium(aquariumWidth)) {
    goingRight = !goingRight;
            if (goingRight) {
            activeTypeName = typeNameR;
        }else{
            activeTypeName = typeNameL;
}
}

        if (goingRight) {
            setPosXStart(posXStart+speed);
        }else{
            setPosXStart(posXStart-speed);
        }
    }
}
