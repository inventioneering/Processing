// Be sure that you've uploaded CircuitPlaygroundFirmata to your board first!

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
String[] valStrings = new String[10000]; // Save up to 10k values

int xPos = 0;

float lightSensorValue = 0;
float tempSensorValue = 0;

int lightSensorNumber = 5;
int tempSensorNumber = 0;

int stringIndex = 0;
float timeSinceStart = 0;
float timeAdjust = 5;


void setup() {
  frameRate(10);
  size(640, 480);
  background(0);
  stroke(255);
  strokeWeight(2);
  smooth();
  noFill();

    
  // Prints out the available serial ports.
  // println(Arduino.list());
  arduino = new Arduino(this, "/dev/cu.usbmodem14121", 9600);
  
  for(int i = 0; i< 9999; i++) {
    valStrings[i] = "0";
  }
  //valStrings[0] = "{light_data,temp_data}";
}

void draw() {
  //arduino.analogRead(lightSensorNumber);
  //fill(255);
  //textSize(16);
  background(0);
  
  textSize(12);
  timeSinceStart = (int)(millis()/1000-timeAdjust);
  text("Press Any Key to save data to file", 40,40);
  text("Approximate running time: "+ timeSinceStart,40,60);

  xPos++;
  stringIndex++;
  if(stringIndex > 9999) {
    stringIndex = 0;
  }
  
  lightSensorValue = arduino.analogRead(lightSensorNumber);
  tempSensorValue = map(arduino.analogRead(tempSensorNumber),500,540,0,20);
  
  textSize(40);
  text("Light Sensor Data: "+(int)lightSensorValue,40,200);
  text("Temp Sensor Data: "+(int)tempSensorValue,40,250);
 
  
  valStrings[stringIndex] = "{"+str(lightSensorValue)+","+str(tempSensorValue)+"}";
  

}

void keyPressed()
{
  println("values: ", valStrings);
  saveStrings("values.txt", valStrings);
  fill(255,0,0);
  text("Data Saved", width - 100, height - 20);
  timeAdjust=millis()/1000;
 
}