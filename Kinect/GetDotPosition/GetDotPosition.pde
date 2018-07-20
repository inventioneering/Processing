// Baased on:
// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/
// by: Daniel Shiffman

import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

boolean debug = true;

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

  // Let's draw the "lerped" location
  PVector dot = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  smooth(8);
  noStroke();
  ellipse(dot.x, dot.y, 20, 20);
  if (debug) { println("xPos: " + dot.x + " yPos: " + dot.y); }
}
