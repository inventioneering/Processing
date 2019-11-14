// Put this code on Tx micro:bit. You can connect w/battery so it can transmit accelerometer and button data wirelessly
/*
﻿from microbit import *
import radio
radio.on()

while True:
    display.show(Image.HAPPY)
    sleep(20)
    a = str(accelerometer.get_values())
    b = str(button_a.is_pressed())
    c = str(button_b.is_pressed())
    d = a + "," + b + "," + c
    radio.send(str(d))
*/


// put this code on Rx micro:bit. Keep it attached to computer via usb to receive Rx transmissions
/*
﻿from microbit import *
import radio
radio.on()

while True:

    display.show(Image.HAPPY)
    message = radio.receive()
    sleep(20)
    print(message)
*/


import processing.serial.*;
Serial port;

float x,y;
boolean button_a, button_b;

void setup() {
 size(500,500);
 //printArray(Serial.list());
 port = new Serial(this, Serial.list()[1], 115200);
 port.bufferUntil(10);
 x = width/2;
 y = height/2;
 button_a = false;
 button_b = false;
}

void draw() {
  if (button_a) {
    background(0,255,0);
  }
  
  if (button_b) {
    background(255,0,0); 
  }

  fill(255);
  rect(x,y,40,40);
}

void serialEvent(Serial port) {
  String inData = port.readString();
  if(inData.charAt(0) == '(') {
    inData = inData.substring(1);
    inData = trim(inData);
    String[] items = split(inData, ',');
    items[2] = items[2].substring(0,items[2].length()-1);
    println("x: " + items[0] + " y: " + items[1] + " z: " + items[2]);
    x = float(items[0]);
    y = float(items[1]);
    x = map(x, -1027, 1027, 0, width);
    y = map(y, -1027, 1027, 0, height);
    button_a = stringToBool(items[3]);
    button_b = stringToBool(items[4]); 
  }
}

boolean stringToBool(String s) {
 boolean result = false;
 if (s.equals("True")) {
  result = true; 
 }
 return result;
}
