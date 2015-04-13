//http://www.instructables.com/id/Arduino-Infrared-Remote-tutorial/
// using for base code to get sensor working 


#include <IRremote.h>
#include <IRremoteInt.h>


int RECV_PIN = 11;
IRrecv irrecv(RECV_PIN);
decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
}

void loop()
{
  if (irrecv.decode(&results))
    {
     Serial.println(results.value, HEX);
     irrecv.resume(); // Receive the next value
    }
}
