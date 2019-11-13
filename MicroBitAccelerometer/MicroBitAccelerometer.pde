import processing.serial.*;
Serial myPort;
float x, y, z, rectX, rectY, rectSize;

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
    float[] data = float(splitTokens(string));
    String[] stringData = splitTokens(string);
      if (data.length >=3) {
      x = data[0];
      y = data[1];
      z = data[2];
    }

    // Show values to console for debugging
    //print("x: ",data[0]);
    //print("\t");
    //print("y: ",data[1]);
    //print("\t");
    //print("z: ",data[2]);
    //print("\n");
    //println(string);
    //println("string: " + string + " raw x: " + xS + " int(s): " + int(xS) + " float(s) " + float(xS));
    //println("string: " + string);

    //println(cleanString(string));
    //printArray(stringArrayFromCleanString(cleanString(string)));
   // String[] dataString = stringArrayFromCleanString(cleanString(string));
    //printArray(dataString);
   // println("[3]" + dataString[3]);
   
   String[] resultString = cleanStringArray(string);
    float xx = getVal(resultString, 0);
    float yy = getVal(resultString, 1);
    float zz = getVal(resultString, 2);
    float btn_a = getVal(resultString, 3);
    float btn_b = getVal(resultString, 4);
    //println("x: " + xx + " y: " + yy + " z: " + zz + "button_a: " + btn_a + " button_b: " + btn_b);
   // println(string);
   
   
   printArray(cleanStringArray(string));
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
