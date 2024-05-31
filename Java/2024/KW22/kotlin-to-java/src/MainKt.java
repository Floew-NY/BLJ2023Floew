
import java.time.LocalDate;
import java.time.Period;
import java.util.Scanner;

public final class MainKt {
   public static final void main() {
      Scanner scanner = new Scanner(System.in);
      String stringNumber = "Enter a number:";
      System.out.print(stringNumber);
      stringNumber = scanner.nextLine();
      int inputNumber = Integer.parseInt(stringNumber);
      LocalDate currentDate = LocalDate.now();
      LocalDate targetDate = LocalDate.now();

      while (true) {
         if (inputNumber == targetDate.getDayOfMonth()) {
            Period var10000 = Period.between(currentDate, targetDate);
            int daysUntil = var10000.getDays();
            String var6 = "The next day is on: " + targetDate;
            System.out.println(var6);
            var6 = "Thats in " + daysUntil + " days!";
            System.out.println(var6);
            return;
         }

         targetDate = targetDate.plusDays(1L);
      }
   }

   // $FF: synthetic method
   public static void main(String[] var0) {
      main();
   }
}
