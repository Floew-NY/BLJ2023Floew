#include <stdio.h>

int main() {
  char thema[] = "Thermonukleare Reaktion";
    
  printf("Wortumkehrer:\n");
  for (int i = sizeof(thema)-2; i >= 0; i--) {
    printf("Buchstabe %d: %c\n", i, thema[i]);
  }
  return 0;
}
