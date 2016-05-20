import processing.video.*;

Capture cam;
int imageWidth = width;
int imageHeight = height;

void setup() {
  size(640, 480);

  //String[] cameras = Capture.list();
  
  //if (cameras.length == 0) {
  //  println("There are no cameras available for capture.");
  //  exit();
  //} else {
  //  println("Available cameras:");
  //  for (int i = 0; i < cameras.length; i++) {
  //   println(cameras[i]);
  //  }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this);
    cam.start(); 
    imageWidth = width;
    imageHeight = height;
       
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, imageWidth, imageHeight);
  if(key == 't')
  {
    key = 'r';
   cam.stop();
   saveFrame();
   delay(200);
   cam.start();
   //cam.read();
  
  }
  
}