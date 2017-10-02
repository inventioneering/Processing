import processing.serial.*;
import cc.arduino.*;
Arduino arduino;


void setup() {
  size(500, 500);
  background(0);
  stroke(255);
  strokeWeight(2);
  smooth();
  noFill();

  arduino = new Arduino(this, "/dev/cu.usbmodem14621", 9600);
  
  arduino.pinMode(0, Arduino.INPUT);
  
 
}

void draw() {
  background(0);
  println(arduino.analogRead(0));
  
  
  
 
}