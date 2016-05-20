import processing.video.*;

Capture theCap; 
int currX, currY;
int capWidth, capHeight;
boolean isCapturing;

void setup() { 
  size(640, 480);

  currX = 0;
  currY = 0;
  capWidth = width/5;
  capHeight = height/5;

  theCap = new Capture(this, capWidth, capHeight, 50);
  isCapturing = true;
  theCap.start();
}

void draw() { 
  //theCap.read();
  image(theCap, currX, currY);
} 

void captureEvent(Capture c) {
  if (isCapturing) {
    c.read(); 

    currX += capWidth;

    // if we're at the end of the line...
    if (currX >= width) {
      // ...go to the beginning of the next line
      currX = 0;
      currY += capHeight;

      // if we're at the bottom of the window...
      if (currY >= height) {
        // ...restart from the top
        currY = 0;
      }
    }
  }
} 

void keyPressed() {
  if (key == ' ') {
    isCapturing = !isCapturing;
  }
}



//  show single live video feed on whole screen
// when space bar is clicked, take picture
// freeze screen, pause capture
// cut screen in half vertically.
// move still image #1 to left side of screen
// put live video feed on right side
// when space bar is clicked again, cut screen in half horizontally

//   x

//  x x
//  x x

//  x x x
//  x x x
//  x x x

//  x x x x
//  x x x x
//  x x x x
//  x x x x

//  x x x x x
//  x x x x x
//  x x x x x
//  x x x x x
//  x x x x x

// if(stage == 1)
// background(255);
// img(static, currentWidth, currentHeight);

// if(stage == 2)
// background(255);
// img(

// I need a nested looping structure that can dynamically create layouts in the staged
// pattern above

// for(int i = 1