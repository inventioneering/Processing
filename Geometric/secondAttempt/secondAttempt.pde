// this value is used to set the array size based on how many values of the sine values
// we want to use for sine on [0, pi/2]
// a higher number means more calculations and thus more iterations and a slower (but smoother)
// drawing.
int numOfCalculations = 60;

// I use this to check to see if the the line segment should be growing, 1 is TRUE
int isGettingLonger = 1;




void setup() {
  // put values into the array sineValues[]
  for(int i = 0; i < sineValues.length; i++) {
   sineValues[i] = sin(sineInput);
    sineInput += increment;
  }
  // used for debugging
  //printArray(sineValues);
  
  background(backgroundColor);
  size(500, 260);  
  stroke(0); 
  strokeWeight(2);
 
  midX = width/2;  // middle x value of canvas
  midY = height/2; // middle y value of canvas
  baseline = height - 10; // where the line is drawn from as measured "up" from bottom
  
  int index = numOfCalculations;
  println(index);
}

void draw() {
  if(mousePressed) {
   
    // this is the section that makes the line get longer.  It requires that we haven't
    // gotten through the whole array and that we shoul be still growing.
     if(index < sineValues.length  && isGettingLonger == 1) {
      background(backgroundColor);   // added this because this line looked darken than the one below
       drawLine(shapeBaseWidth*sineValues[index]);
       index++;
       //println(index);  // error checking
   } else {
     // sets the switch to make sure we stay in this else portion of the loop and don't return
     // to the if portion above.
     isGettingLonger = 0;
    
     index--;
     
     // once we are back to index == 0 then we should start getting longer again (or stop...
     // may add later)... so we make the second required condition above true so we will
     // leave the "else" portion of this conditional and return to the "if" portion above.
     if(index == 0) {
       isGettingLonger = 1;
     } else {
       background(backgroundColor);
       drawLine(shapeBaseWidth*sineValues[index]);
       //println(index);  // error checking
       }
     }
   
  
   }
   
  }


 












