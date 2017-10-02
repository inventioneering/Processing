import processing.serial.*;
Serial myPort;
int x,y,value;

String sensorValue = "";

void setup() 
{
  size(600,600);
  String usbmodem1411 = Serial.list()[0];
  myPort = new Serial(this, "/dev/cu.usbmodem14621", 9600);
  stroke(0);
  fill(255,0,0);

}

void draw()
{
  background(255);
  
  if(myPort.available() > 0) 
  {
    sensorValue = myPort.readStringUntil('\n');
 
    if(sensorValue != null) {
      value = (int)float(sensorValue);
      
      if(value == 1) //Down
      {
       y -= 5; 
      } 
    
      else if (value == 2) 
      { //Up
       y += 5;
      } 
    
      else if (value == 3) 
      { //Left
        x -= 5; 
      } 
      
      else if (value == 4) 
      { //Right
        x += 5;
      }
      
   }
   
 }

 rect(x,y,64,64);
}