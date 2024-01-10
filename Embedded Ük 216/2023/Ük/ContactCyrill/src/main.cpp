#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Servo.h>

#define SERVO_PIN 12

#define Button 27
#define servoPin 18

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels

#define OLED_RESET -1 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

Servo servo;

void setup()
{
  Serial.begin(115200);
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C))
  {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;)
      ;
  }

  servo.attach(servoPin);
  pinMode(Button, INPUT_PULLUP);
}

int pos = 0;

void loop()
{
  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println("Button:");
  display.println(String(digitalRead(Button)));
  if (digitalRead(Button) == LOW)
  {
    if (pos == 0)
    {

      servo.write(0);
      delay(100);
      pos = 20;
      servo.write(90);
    }
  }
  else
  {
    if (pos != 0)
    {
      servo.write(150);
      delay(100);
      pos = 0;
      servo.write(90);
    }
  }

  display.display();
}