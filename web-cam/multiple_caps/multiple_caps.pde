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