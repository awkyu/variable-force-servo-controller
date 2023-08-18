int sinOutPin = 9;
int sinInPin = A2;

int time1;
int time2;

float hz = 2.0;
float w = hz * 2 * PI;

//  // code for min/max
//float win[100];
//int count;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(sinOutPin, OUTPUT);
  pinMode(sinInPin, INPUT);
  
  analogReadResolution(12);

  time1 = micros();
  time2 = micros();

//  // code for min/max
//  count = 0;
}

void loop() {
  // put your main code here, to run repeatedly:
  time2 = micros();
  int output_val = 255/3.3*sin(w*time2/1000000) + 255/2;

  analogWrite(sinOutPin, output_val);
  
  if ((time2 - time1) > 2000) {
    time1 = micros();
    float input_val = analogRead(sinInPin)/4095.0 * 3.3;

//    // Additional Code for computing min and maxes
//    win[count%100] = input_val;
//    count++;
//    float min_val = 3.3;
//    float max_val = 0.0;
//    for (int i = 0; i < 100; i++) {
//      min_val = win[i] < min_val ? win[i] : min_val;
//      max_val = win[i] > max_val ? win[i] : max_val;
//    }
    
    Serial.println(input_val);
  }
}
