int ledPin = 10;
int ledPin2 = 11;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2,OUTPUT);

}

void loop() {

digitalWrite(ledPin, HIGH);
delay(500);
digitalWrite(ledPin2,HIGH);

delay(500);

digitalWrite(ledPin, LOW);
delay(500);
digitalWrite(ledPin2,LOW);

delay(500);

}
