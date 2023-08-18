#include <Servo.h>

Servo servo;

int time1;
int time2;

int servoPWMPin = 8;
float hz = 0.5;
float w = hz * 2 * PI;

void setup() {
  // put your setup code here, to run once:
  servo.attach(servoPWMPin);
  time1 = micros();
  time2 = micros();
}

void loop() {
  // put your main code here, to run repeatedly:
  time2 = micros();
  int output_val = 45*sin(w*time2/1000000) + 45;

  if ((time2 - time1) > 100000) {
    servo.write(output_val);
  }
  
}
