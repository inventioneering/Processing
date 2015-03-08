// use the y-values of the sine function on [0,pi/2] to grow the line
float[] sineValues = new float[256];
float increment = (12 * PI)/256;
float sineInput = 0;
int j = 0;


// create variables for centerpoint of canvas and scale value
int midX = 0;
int midY = 0;
int baseline = 0;
int shapeBaseWidth = 80;

void setup() {
  //stick all the sine values in the array
  for(int i = 0; i < 255; i++) {
   sineValues[i] = sin(sineInput);
    sineInput += increment;
    //println(sineValues[i]);
  }
  
  background(210);
  size(1024, 400);  
  stroke(0); 
  strokeWeight(2);
  sineInput = 0;
  
  midY = height/2;
}

void draw() {
   if(mousePressed) {
    point(sineInput, midY + sineValues[j]*200);
    j++;
    sineInput += increment;
   }
  
}













