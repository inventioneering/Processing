import processing.serial.*;
Serial myPort;
float x, y, z, rectX, rectY, rectSize;
    
void setup() {
  size(500,500);
  background(0);
  smooth();
  myPort = new Serial(this, "/dev/cu.usbmodem14521", 9600);
  myPort.bufferUntil('\n');
  rectX = width/2;
  rectY = height/2;
  rectSize = 40;
}


void draw() {
 background(0);
 fill(255);
 rectX += x;
 rectY += y;
 rect(rectX,rectY,rectSize,rectSize);
}

void serialEvent(Serial myPort) {
  String string = myPort.readStringUntil('\n');
  
  if(string != null) {
    string = trim(string);
    float[] data = float(splitTokens(string));
    if (data.length >=3) {
      x = data[0];
      y = data[1];
      z = data[2];
    }
    
    // Show values to console for debugging
    print("x: ",data[0]);
    print("\t");
    print("y: ",data[1]);
    print("\t");
    print("z: ",data[2]);
    print("\n");
  }
}