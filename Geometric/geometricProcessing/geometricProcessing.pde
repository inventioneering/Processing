// create variables for centerpoint of canvas and scale value
int midX = 0;
int midY = 0;
int baseline = 0;
float triangleCounter = 0;
float scale = 1;
float shapeBaseWidth = 80;

void setup() {
  background(210);
  size(500, 260);  
  stroke(0); 
 
  midX = width/2;  // middle x value of canvas
  midY = height/2; // middle y value of canvas
  baseline = height - 10; // where the line is drawn from as measured "up" from bottom
  triangleCounter = baseline; // this gives me a way to keep track of the triangle growth
}

void draw() {
   
  // according to the trig, this should be the topmost point for the triangle
  //point(midX, baseline-69.28);
  
  // basically makes the bottom line grow to a width of 80
  if(scale < shapeBaseWidth) {
    scale = drawLine(scale);
  }
   
   // scale now acts as a counter for the overall drawing...
   else if(scale < 150) {
     scale++;
     // draw the traingle until we reach 150 = shapeBaseWidth + 69.28
     // which is the height of the traingle's topmost vertex off the baseline
     triangleCounter = drawTriangle(triangleCounter);
   }
  else {
    // reset the view and all the counter variables
    background(210);
    triangleCounter = baseline;
    scale = 1; 
  }
}













