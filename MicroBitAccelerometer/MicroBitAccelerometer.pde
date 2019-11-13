import processing.serial.*;
Serial myPort;
float x, y, z, button_a, button_b, rectX, rectY, rectSize;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  myPort = new Serial(this, "/dev/cu.usbmodem143102", 115200);
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
  rect(rectX, rectY, rectSize, rectSize);
}

void serialEvent(Serial myPort) {

  String string = myPort.readStringUntil('\n');

  if (string != null) {
    string = trim(string);
    //float[] data = float(splitTokens(string));
   // String[] stringData = splitTokens(string);
    
   
   String[] resultString = cleanStringArray(string);
    x = getVal(resultString, 0);
    y = getVal(resultString, 1);
    z = getVal(resultString, 2);
    button_a = getVal(resultString, 3);
    button_b = getVal(resultString, 4);
    println("x: " + x + " y: " + y + " z: " + z + "button_a: " + button_a + " button_b: " + button_b);
   // println(string);
   
   
   printArray(resultString);
  }
}



String[] cleanStringArray(String s) {
 String[] result;
 result = split(s,",");
 result[0] = result[0].substring(1,result[0].length()); // remove the leading "("
 result[2] = result[2].substring(0,result[2].length()-1); // remove the closing ")"
 result[3] = booleanStringToIntString(result[3]); // convert "False" -> 0, and "True" 0 -> 1
 result[4] = booleanStringToIntString(result[4]);
 return result;
}


float getVal(String[] s, int index) {
    return float(s[index]);
}

String booleanStringToIntString(String s) {
  String result;
  if(s.equals("False")) {
    result = "0";
  }
  else if(s.equals("True")) {
    result = "1"; 
  }
  else {
    result = "-1"; 
  }
  return result;
}
