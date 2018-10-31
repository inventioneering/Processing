// requires "CircuitPlaygroundFirmata" sketch to be installed on CircuitPlayground

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
float sensorValue = 0;
float rawValue;

int x = 0;
int y = 0;
int spacing = 20;

void setup()
{
  size(500, 500);
  background(0);
  arduino = new Arduino(this, "/dev/cu.usbmodem14121", 9600);
  frameRate(10);
}

void draw()
{
  rawValue = arduino.analogRead(5);
  sensorValue = map(rawValue,50,1000,0,1);
    createImage(sensorValue);
    println(rawValue);
}

void createImage(float v) {
  background(0);
  while(y<height) {
  stroke(255);
  if(random(1) > v)
  {
    line(x, y, x + spacing,  y + spacing);
  }
  else
  {
    line(x, y + spacing, x + spacing, y);
  }
  x += spacing;
  if(x > width)
  {
    x = 0;
    y += spacing;
  }
  }
  x=0;
  y=0;
}

void keyPressed() {
  if(key=='a') {
    sensorValue = map(arduino.analogRead(5),50,1000,0,1);
    createImage(sensorValue);
    println(sensorValue);
    key='c';
  }
 
}
