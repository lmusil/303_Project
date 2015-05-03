// This code is sampled from https://learn.adafruit.com/tmp36-temperature-sensor/using-a-temp-sensor
// Part of this code is taken from class notes and LED examples
char val; // Data received from the serial port
int ledPin = 10;
int ledPin2 =11;
//TMP36 Pin Variables
int sensorPin = 0; //the analog pin the TMP36's Vout (sense) pin is connected to
                        //the resolution is 10 mV / degree centigrade with a
                        //500 mV offset to allow for negative temperatures
 
 
 
void setup() 
{
 pinMode(ledPin, OUTPUT);
 pinMode(ledPin2,OUTPUT);
 //initialize serial communications at a 9600 baud rate
 Serial.begin(9600);
 establishContact(); // send a byte to establish contact until receiver responds 
}


void loop()
{
int reading = analogRead(sensorPin);  
  
 float voltage = reading * 5.0;
 voltage /= 1024.0; 
  
  // print out the voltage
 //Serial.print(voltage); 
 //Serial.println(" volts");
 
 // now print out the temperature
 float temperatureC = (voltage - 0.5) * 10 ;  //converting from 10 mv per degree wit 500 mV offset
 //Serial.print(temperatureC); Serial.println(" degrees C");
 // now convert to Fahrenheit
 float temperatureF = (temperatureC * 9.0 / 5.0) + 32.0;
 Serial.print(temperatureF); 
 //Serial.println(" degrees F");
 
 Serial.println(temperatureF); // send to Processing
 delay(500);
 digitalWrite(ledPin, LOW);
 digitalWrite(ledPin2, LOW);//resets lights waiting for next value
 


 if (Serial.available() > 0) { // If data is available to read,
 val = Serial.read(); // read it and store it in val
 delay(50);
  if(val == 'R'){ //Red light trigger
 
 digitalWrite(ledPin, HIGH); 
 delay(50);
 } 
 else {
   if(val == 'G') // Green light trigger
   {
     digitalWrite(ledPin2, HIGH);
   delay(50);
 }
 else{
   if(val == 'B') //Triggers both lights
   {
     digitalWrite(ledPin, HIGH);
     digitalWrite(ledPin2, HIGH);
   delay(50);
 }
 else{
 Serial.println("Marco"); //send back a hello world
 delay(50);
 }
}
}
}
}



void establishContact() {
while (Serial.available() <= 0) {
Serial.println("Connecting"); // send a capital A
delay(300);
}
}
