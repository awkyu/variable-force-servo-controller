#include <Servo.h>

Servo servo;

int servoOut = 9;
int forceIn = A2;

int time1;
int time2;
int time3;

float hz = 2.0;
float w = hz * 2 * PI;

#define NUM_WIN 100
int window[NUM_WIN] = {0};
int count = 0;
int angle;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(servoOut, OUTPUT);
  pinMode(forceIn, INPUT);
  servo.attach(servoOut);
    
  analogReadResolution(12);

  time1 = micros();
  time2 = micros();
  time3 = micros();
  angle = 0;
}

void loop() {
  // put your main code here, to run repeatedly:
  time2 = micros();

  if ((time2 - time1) > 2000) {
    time1 = micros();
    angle = analogRead(forceIn)/4095.0 * 90;
    window[count%NUM_WIN] = angle;
    count++;
  }
  if ((time2 - time3) > 100000) {
    time3 = micros();
    int avg = 0;
    for (int i = 0; i < NUM_WIN; i++) {
      avg += window[i];
    }
    avg = avg/NUM_WIN;
    servo.write(avg);
    Serial.println(avg);
  }
}
