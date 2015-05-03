import ddf.minim.*; AudioPlayer Music; Minim minim; UIPanel myPanel; // Stevens UI Additions <seiselen>

import processing.serial.*; //import the Serial library
Serial myPort; //the Serial port object
String val;

boolean firstContact = false;



float demoLevel;


void setup(){
  
   size(700,400); minim = new Minim(this); myPanel = new UIPanel(); smooth(); // <seiselen>

myPort = new Serial(this, Serial.list()[0], 9600);
myPort.bufferUntil('\n'); 
   
   //demoLevel = 0.1f;
   

  

}

void draw(){
  //if(demoLevel > 10){demoLevel = 0.1f;} 
  //demoLevel += 0.01f;
  myPanel.run(); // <seiselen>
  
  

}





void serialEvent( Serial myPort) {
//put the incoming data into a String - 
//the '\n' is our end delimiter indicating the end of a complete packet
val = myPort.readStringUntil('\n');
//make sure our data isn't empty before continuing
if (val != null) {
//trim whitespace and formatting characters (like carriage return)
val = trim(val);
//println(val);

//look for our 'A' string to start the handshake
//if it's there, clear the buffer, and send a request for data
if (firstContact == false) {
if (val.equals("Connecting")) {
myPort.clear();
firstContact = true;
myPort.write("Polo");
//println("contact");
}
}
else { //if we've already established contact, keep getting and parsing data

//println(val);

//println("Polo");

if (mousePressed == true) 
{ //if we clicked in the window
myPort.write('1'); //send a 1
//println("1");
}

// when you've parsed the data you have, ask for more:
myPort.write("Polo");

}
}


try { demoLevel = Float.parseFloat(val); println(demoLevel); } 
catch (NumberFormatException e) {}


} // Ends Serial Events

