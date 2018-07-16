import org.openkinect.processing.*;

Kinect kinect;

float angle;

void setup() {
  size(640,480);
  kinect = new Kinect(this);
  //kinect.initVideo();
  kinect.initDepth();
  //kinect.enableIR(true);
  angle = kinect.getTilt();
  angle = angle + 1;
  kinect.setTilt(angle);
  //kinect.enableMirror(true);
}

void draw() {
  angle = kinect.getTilt();
  angle = angle + 1;
  kinect.setTilt(angle);
  //PImage img = kinect.getVideoImage();
  PImage img = kinect.getDepthImage();
  image(img,0,0);
}
