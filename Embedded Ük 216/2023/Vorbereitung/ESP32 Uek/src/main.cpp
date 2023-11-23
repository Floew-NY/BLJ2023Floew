#include <Arduino.h>
#include <WiFi.h>

// put function declarations here:
int myFunction(int, int);

void setup()
{
  // put your setup code here, to run once:
  String result = "Hello World!";
  Serial.begin(115200);
  Serial.println(result);
}

void loop()
{
  // put your main code here, to run repeatedly:
  WiFi.softAP("Network1");
  delay(1000);
  WiFi.softAP("Network2");
  delay(1000);
}

// put function definitions here:
int myFunction(int x, int y)
{
  return x + y;
}