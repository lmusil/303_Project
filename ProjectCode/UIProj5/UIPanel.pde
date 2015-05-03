class UIPanel{
  PImage SensorPanel; PImage LevelPanel; PImage BarLevPanel; PImage ColorPanel; PImage StatusPanel;
  PImage heatMin; PImage heatMod; PImage heatMax; PFont future = loadFont("DooM-48.vlw");
  int sensorPanelDropLength = -80; boolean sensorPanelDropped = false;  
  int colorPanelDropLength = -92; boolean colorPanelDropped = false; 
  int barPanelDropLength = 80; boolean barPanelDropped = false; 
  int statusPanelDropLength = -522; boolean statusPanelDropped = false; 
  int levelPanelDropLength = 96; boolean levelPanelDropped = false;
  int alphaSensorBar = 120;   
  AudioSnippet beep = minim.loadSnippet("bleep.wav");
  AudioSnippet beep2 = minim.loadSnippet("bleep.wav");
  AudioSnippet beep3 = minim.loadSnippet("bleep.wav");
  AudioSnippet beep4 = minim.loadSnippet("bleep.wav");
  AudioSnippet beep5 = minim.loadSnippet("bleep.wav");
  AudioSnippet lower = minim.loadSnippet("doorCloseDoom.wav");
  AudioSnippet lower2 = minim.loadSnippet("doorCloseDoom.wav");
  AudioSnippet lower3 = minim.loadSnippet("doorCloseDoom.wav");
  AudioSnippet lower4 = minim.loadSnippet("doorCloseDoom.wav");
  AudioSnippet lower5 = minim.loadSnippet("doorCloseDoom.wav");  
  AudioSnippet alarm = minim.loadSnippet("alarm.wav");
   
  public UIPanel(){
    SensorPanel = loadImage("SensorPanel.jpg"); LevelPanel = loadImage("LevelPanel.jpg");
    BarLevPanel = loadImage("BarLevPanel.jpg"); ColorPanel = loadImage("ColorPanel.jpg");
    StatusPanel = loadImage("StatusPanel.jpg"); heatMin = loadImage("heatMin.gif");
    heatMod = loadImage("heatMod.gif"); heatMax = loadImage("heatMax.gif");
  } // Ends Constructor
  
  public void run(){
    if(millis() > 2500 && sensorPanelDropped == false){dropSensorPanel();}
    if(millis() > 4000 && colorPanelDropped == false){dropColorPanel();}
    if(millis() > 5500 && barPanelDropped == false){dropBarPanel();}
    if(millis() > 500 && statusPanelDropped == false){dropStatusPanel();}
    if(millis() > 7000 && levelPanelDropped == false){dropLevelPanel();}
    if(millis() > 2500){lower.play();} if(millis() > 4000){lower2.play();}
    if(millis() > 5500){lower3.play();} if(millis() > 7000){lower4.play();}
    background(60); noStroke(); 
    image(SensorPanel, 0, sensorPanelDropLength); 
    image(ColorPanel, 400, colorPanelDropLength); 
    image(BarLevPanel, 620 + barPanelDropLength,0); 
    image(StatusPanel, statusPanelDropLength,110); 
    image(LevelPanel, 0,304 +levelPanelDropLength);
    if(sensorPanelDropped == true){drawSensorPanelStuff();}
    if(colorPanelDropped == true){drawColorPanelStuff();}
    if(barPanelDropped == true){drawBarPanelStuff();}
    if(statusPanelDropped == true){drawStatusPanelStuff();}
    if(levelPanelDropped == true){drawLevelPanelStuff();}
    if(demoLevel > 8 && !alarm.isPlaying()){alarm.pause();alarm.rewind();alarm.play();}  
  } // Ends Run
  
  private void dropSensorPanel(){if (sensorPanelDropLength >= 0){sensorPanelDropped = true;beep.play();}sensorPanelDropLength++;}
  private void dropColorPanel(){if (colorPanelDropLength >= 0){colorPanelDropped = true;beep2.play();}colorPanelDropLength++;}
  private void dropBarPanel(){if (barPanelDropLength <= 0){barPanelDropped = true;beep3.play();}barPanelDropLength--;}
  private void dropStatusPanel(){if (statusPanelDropLength >= 0){statusPanelDropped = true;beep4.play();}statusPanelDropLength++;}
  private void dropLevelPanel(){if (levelPanelDropLength <= 0){levelPanelDropped = true;beep5.play();}levelPanelDropLength--;}
 
  private void drawSensorPanelStuff(){
   
   if(alphaSensorBar <= 0){alphaSensorBar = 255;} 
   
   fill(255,0,0,alphaSensorBar);
   ellipse(329,41,30,30);
   alphaSensorBar-=4;
   
   fill( int(random(230,255)), 0, 0);
   textFont(future, 18);
   text( "THERMAL SENSOR\n\n          ACTIVATED", 15,30);
   
   // I WANT TO PUT CODE HERE THAT HAS IT SAY 'DEACTIVATED' UNTIL THE HANDSHAKE IS COMPLETE
   
 
  } // Ends drawSensorPanelStuff
 
  public void drawBarPanelStuff(){
   
   fill( 0, 0, int(random(210,255)));
   textFont(future, 14);
   text( " HEAT\n\nLEVEL", 628,20);
   
   if(demoLevel < 3.33){fill(0,255,0);}
   else if(demoLevel < 6.66){fill(255,180,0);}
   else if(demoLevel < 10){fill(255,0,0);}
   
   float theNum = ((demoLevel*300)/10) * -1; // Math modifier for the range
   
   rect(634,346,50,theNum);
   
 
  } // Ends drawBarPanelStuff
 
  private void drawLevelPanelStuff(){
   
   fill( int(random(230,255)), 0, 0);
   textFont(future, 24);
   text( "THERMAL\n\nLEVEL...", 10,345);
   fill( int(random(180,255)));
   textFont(future, 66);
   text( demoLevel, 190,380);
 
  } // Ends drawLevelPanelStuff
 
  private void drawStatusPanelStuff(){
    if(demoLevel < 3.33){image(heatMin, statusPanelDropLength,110);}
    else if(demoLevel < 6.66){image(heatMod, statusPanelDropLength,110);}
    else if(demoLevel < 10){image(heatMax, statusPanelDropLength,110);}
  } // Ends drawStatusPanelStuff
 
  private void drawColorPanelStuff(){
    fill(255); rect(440,23,100,60);   
    if(demoLevel < 6.66){fill(0,255,0,60);ellipse(470,53,60,60);}
    if(demoLevel < 10 && demoLevel > 3.33){fill(244,0,0,60);ellipse(510,53,60,60);}
 
  } // Ends drawStatusPanelStuff
 
 
} // Ends Class UIPanel
