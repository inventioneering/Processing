import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int xPos = 0;
float sensorValue = 0;
int sensorNumber = 5;

void setup() {
  size(640, 480);
  background(0);
  stroke(255);
  strokeWeight(2);
  smooth();
  noFill();
    
  // Prints out the available serial ports.
  // println(Arduino.list());
  arduino = new Arduino(this, "/dev/cu.usbmodem14611", 57600);
}

void draw() {
  xPos++;
  fill(255);
  sensorValue = map(arduino.analogRead(sensorNumber),0,400,0,width);
  ellipse(xPos,sensorValue, 5, 5);
  if (xPos > width) 
  {
    xPos = 0;
    background(0);
  }
}