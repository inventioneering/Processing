// this value is used to set the array size based on how many values of the sine values
// we want to use for sine on [0, pi/2]
// a higher number means more calculations and thus more iterations and a slower (but smoother)
// drawing.
int numOfCalculations = 60;  // set the animation speed

// I use this to check to see if the the line segment should be growing, 1 is TRUE
//int isGrowing = 1;
int stageNumber = 1;

// this will get assigned after the array gets filled up.
float triangleHeight = 0;

void setup() {
  // put values into the array sineValues[]
  for(int i = 0; i < sineValues.length; i++) {
   sineValues[i] = sin(sineInput);
    sineInput += increment;
  }
  
  //printArray(sineValues);
  
  // will recalculate the sidth length parametrically based on shapeBaseWidth
  triangleHeight = (sqrt(3))*(shapeBaseWidth * sineValues[sineValues.length -1]);
  // used for debugging
  //printArray(sineValues);
  
  background(backgroundColor);
  size(500, 260);  
  stroke(0); 
  strokeWeight(2);
  fill(255);
 
  midX = width/2;  // middle x value of canvas
  midY = height/2; // middle y value of canvas
  baseline = height - 10; // where the line is drawn from as measured "up" from bottom
  
  int index = numOfCalculations;
  //println(index);
  
  fill(255);
}

void draw() {
  //if(mousePressed) {
   
    // this is the section that makes the line get longer.  It requires that we haven't
    // gotten through the whole array and that we shoul be still growing.
     if(index < sineValues.length  && stageNumber == 1) {
      background(backgroundColor);   // added this because this line looked darken than the one below
       drawLine(shapeBaseWidth*sineValues[index]);
       index++;
       
      
   } else {
     stageNumber = 2;
     background(backgroundColor);
     //print("index: ", index, "\n");  // debugging
    
     if (index == numOfCalculations && stageNumber == 2) {
        index = 0;
        print("I just reset the index to:" , index, "\n"); 
       } 
       
     //line(midX, baseline, midX, baseline - triangleHeight);  //error checking -- top of triangle
  
     // stop at baseline - triangleHeight
     // drawTriangle(baseline - triangleHeight);
     // println("triangle height: ", triangleHeight);
     // println("triangle side length" , 2*shapeBaseWidth);
     
      
      // we are going to draw lots of triangles who's heights are controlled
      // by multiplying the final height of the last triangle by values from sineValues
      // one at a time... and since they range from [0,1] they work as percentages.
      drawTriangle(index);
      
      index++;
      
      // this pairs with some code down in the drawTriangle() function 
      // I'm using it to speed up the animation without having to make a new array
      // it just uses the even number indexed values basically cutting the array in half.
      if (2*index == numOfCalculations) {
        noLoop();
        println("All Done");
      }
     
    
    
   }
   
 //  } // mousePressed

} // EOF


void drawTriangle(int i) {
  
  // goes through every other item of the array which allows the program to move more quickly
   if (2*i < numOfCalculations) {
     i = 2*i;
   }
  
   // setup variables to plug into triangle code below
   float x1 = midX - shapeBaseWidth; // shapeBaseWidth is a terrrible name, its only half the base width
   float x2 = midX + shapeBaseWidth;
   float x3 = midX;
   float y1 = baseline;  // baseline is the location of the base of the shape
   float y2 = y1;
   float y3 = baseline - (triangleHeight * sineValues[i]); // this makes incrementally bigger heights
  
   
   triangle(x1, y1, x2, y2, x3, y3);

}

 












