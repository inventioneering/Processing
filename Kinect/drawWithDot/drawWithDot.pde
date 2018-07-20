// Daniel Shiffman
// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/


import org.openkinect.processing.*;

ArrayList<PVector> history = new ArrayList<PVector>();

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;


void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  //ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  smooth(8);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  
  // draw a line to follow the palm
  history.add(new PVector(v2.x, v2.y));
  for(int i = 1; i<history.size()-1; i++) {
    PVector pointOne = history.get(i);
    PVector pointTwo = history.get(i+1);
    stroke(0,0,255);
    strokeWeight(2);
    line(pointOne.x, pointOne.y, pointTwo.x,pointTwo.y);
  }
}
  
void keyPressed() {
  if(key == 'r') {
    history.clear();
  }
}



//  // Display some info
//  int t = tracker.getThreshold();
//  fill(0);
//  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
//    "UP increase threshold, DOWN decrease threshold", 10, 500);


// Adjust the threshold with key presses
//void keyPressed() {
//  int t = tracker.getThreshold();
//  if (key == CODED) {
//    if (keyCode == UP) {
//      t+=5;
//      tracker.setThreshold(t);
//    } else if (keyCode == DOWN) {
//      t-=5;
//      tracker.setThreshold(t);
//    }
//  }
