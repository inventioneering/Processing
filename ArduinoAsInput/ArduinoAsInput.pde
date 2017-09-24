import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
String[] rightButton = new String[10];
String[] leftButton = new String[10];
float m = millis();
float rS, lS, rE, lE;
int i = 0;
color rCol = color(255, 0, 0);
void setup(){
  background(255);
  size(600, 600);
  println(Arduino.list());
  //arduino = new Arduino(this, Arduino.list()[4], 57600);
  arduino = new Arduino(this, "/dev/cu.usbmodem14111", 57600);
  arduino.pinMode(19, Arduino.INPUT);
  arduino.pinMode(4, Arduino.INPUT);
}

void draw(){

    if(arduino.digitalRead(19) == 1){
      fill(0);
    }
    
    if(arduino.digitalRead(4) == 1){
      fill(255,0,0);
    }
    
    
    rect(width/2,height/2,width/4,height/4);
}