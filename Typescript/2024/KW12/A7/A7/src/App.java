public class App {
    public static void main(String[] args) throws Exception {
        int input = 100;

        System.out.println(isPalindrom(input));
    }

      static boolean isPalindrom(int number){
        int temp = number;
        System
        while (true) {
            if (temp == 0) {
                return true;
            }
            if (lastNumber(temp) == firstNumber(temp)) {
                return false;
            }
            temp = trimBothSides(temp);
        } 
    } 

    
    static int lastNumber(int number){
        return number % 10;
    }
    static int firstNumber(int number){
        int exponent = (int) Math.floor(Math.log10(number));
        return number / (int) Math.pow(10, exponent);
    }
    public static int trimBothSides(int number) {
        int exponent = (int) Math.floor(Math.log10(number));
        int firstRemovedNumber = number % (int) Math.pow(10, exponent);
        return firstRemovedNumber / 10;
    }
}
